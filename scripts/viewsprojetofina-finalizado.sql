
-- VIEW 01
-- vw_usuario - Esta visualização deve conter todos os dados de todos os usuários, deseja-se também saber
-- quais são funcionários e quais são clientes, o endereço de cada um e seu pais de origem,  
-- quantos perfis cada um tem e qual é o seu plano.

CREATE VIEW vw_usuario AS
SELECT
    u.id_usuario,
    u.nome,
    u.data_atualizacao,
    u.sobrenome,
    u.email,
    u.status,
    u.data_nascimento,
    u.data_cadastro,
    CONCAT(e.rua,', ',e.bairro, ', ',e.quadra,', ',e.numero) AS endereco,
    e.cep,
	p.nome as nome_pais,
    pl.descricao,
    CASE
        WHEN f.id_funcionario IS NOT NULL THEN 'Funcionário'
        WHEN c.id_cliente IS NOT NULL THEN 'Cliente'
		ELSE 'N/A'
    END AS tipo_usuario,
    (SELECT COUNT(*) FROM tb_perfil WHERE id_cliente = c.id_cliente) AS qtd_perfis    
FROM
    tb_usuario as u
    LEFT JOIN tb_funcionario as f ON f.id_usuario = u.id_usuario
    LEFT JOIN tb_cliente as c ON c.id_usuario = u.id_usuario
    LEFT JOIN tb_endereco as e ON e.id_endereco = u.id_endereco
    LEFT JOIN tb_pais as p ON p.id_pais = e.id_pais
    LEFT JOIN tb_plano as pl ON pl.id_plano = c.id_plano;

select * from vw_usuario;

-- vw_catalogo - Esta visualização deve conter todos os dados do catalogo, 
-- identificando series e filmes, (não devem estar presente os episodios nesta view), o idioma original 
-- e quantos idiomas são possíveis escolher, a classificação indicativa e suas categorias.

CREATE VIEW vw_catalogo AS
SELECT 
c.id_catalogo,
c.pais_origem,
c.imagem_capa,
c.titulo,
c.sinopse,
c.ano_lancamento,
c.duracao,
c.avaliacao,
c.data_atualizacao,
c.id_idioma,
i.nome as idioma_original,
cla.descricao as classificacao,
cat.nome as categoria,
(SELECT COUNT(*) from tb_catalogo_idioma WHERE id_catalogo = c.id_catalogo) AS Quant_idioma_disponivel,
CASE
        WHEN c.tipo_midia = 'F' THEN 'Filme'
        WHEN c.tipo_midia = 'S' THEN 'Serie'
		ELSE 'N/A'
END AS Tipo_catalogo
from tb_catalogo as c 
LEFT JOIN tb_idioma as i on i.id_idioma = c.id_idioma
LEFT JOIN tb_classificacao as cla on cla.id_classificacao=c.id_classificacao
LEFT JOIN Tb_catalogo_categoria as cc on cc.id_catalogo= c.id_catalogo 
LEFT JOIN tb_categoria as cat on cat.id_categoria= cc.id_categoria; 

select * from vw_catalogo;

-- vw_episodio - Esta visualização deve conter todos os dados dos episódios, qual sua serie, e de qual temporada ele é.

CREATE VIEW vw_episodio AS
SELECT 
c.titulo as nome_serie,
t.numero_temporada as numero_temporada,
t.titulo as nome_temporada,
t.quantidade_episodio,
e.numero_episodio
FROM tb_catalogo as c
INNER JOIN tb_episodio as e on e.id_catalogo=c.id_catalogo
LEFT JOIN tb_temporada as t on t.id_temporada=e.id_temporada;

select * from vw_episodio;
-- vw_temporada - Esta visualização deve conter todos os dados da temporada, a sua quantidade de episodios, e sua série.

CREATE VIEW vw_temporada AS
SELECT 
t.numero_temporada as numero_temporada,
t.titulo as nome_temporada,
t.descricao as descricao,
t.quantidade_episodio,
c.titulo as nome_serie
FROM tb_catalogo as c
inner JOIN tb_episodio as e on e.id_catalogo=c.id_catalogo
LEFT JOIN tb_temporada as t on t.id_temporada= e.id_temporada
LEFT JOIN tb_serie as s on s.id_serie = t.id_serie;

select *from tb_temporada;

-- vw_ator - Deve conter todos os dados dos atores, quantidades de filmes feito por ele, quantidade de series feita por ele.


CREATE VIEW vw_ator AS
SELECT 
a.nome,
a.sobrenome,
a.data_nascimento,
a.foto,
COUNT(F.ID_CATALOGO) as qtd_filmes,
COUNT(S.ID_CATALOGO) as qtd_series
FROM tb_ator  a 
LEFT JOIN tb_catalogo_ator as ca on ca.id_ator = a.id_ator
LEFT JOIN tb_catalogo as c on c.id_catalogo = ca.id_catalogo
LEFT JOIN tb_filme F ON f.id_catalogo = c.id_catalogo
LEFT JOIN tb_serie S ON s.id_catalogo = c.id_catalogo
GROUP BY a.nome, a.sobrenome, a.data_nascimento, a.foto;

select * from vw_ator;

-- vw_pagamento - Deve conter todos os dados de pagamento, seu tipo, o nome do cliente, seu plano e data de vencimento.
CREATE VIEW vw_pagamento AS
SELECT 
p.id_pagamento,
p.valor,
p.data_pagamento,
p.id_cartao,
c.id_plano,
u.nome as nome_cliente,
tp.nome as tipo_pagamento,
pl.descricao as nome_plano,
c.data_vencimento_plano
FROM tb_pagamento as P
LEFT JOIN tb_tipo_pagamento as Tp ON tp.id_tipo_pagamento = p.id_tipo_pagamento
LEFT JOIN tb_cliente as c ON p.id_cliente=c.id_cliente
LEFT JOIN tb_usuario as U ON u.id_usuario=c.id_usuario
LEFT JOIN tb_plano as pl ON pl.id_plano=c.id_plano;

select * from vw_pagamento;

-- vw_perfil - deve conter todos os dados do perfil e seu cliente.
CREATE VIEW vw_perfil AS
SELECT 
p.foto as foto_perfil, 
p.nome as nome_perfil,
p.tipo as tipo_perfil,
u.nome as nome_cliente,
c.id_usuario,
c.id_cartao,
c.id_plano,
c.data_vencimento_plano 
FROM tb_perfil p
INNER JOIN tb_cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN tb_usuario u ON u.id_usuario =c.id_usuario;

SELECT * FROM vw_perfil;