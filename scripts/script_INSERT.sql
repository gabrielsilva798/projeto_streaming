-- INSERT DB_STREAMING 

-- 1 tb_classificacao_indicativa
INSERT INTO tb_classificacao_indicativa
 (idade, descricao, dt_atualizacao)
VALUES
	('livre', 'O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.', CURDATE()),
	('10', 'pode conter algum tipo de violência leve, linguagem moderada ou temas levemente mais complexos, mas adequados para crianças com pelo menos 10 anos de idade.', CURDATE()),
	('12', ' pode conter violência um pouco mais intensa, linguagem um pouco mais forte e temas que possam ser mais complexos para crianças mais jovens. ', CURDATE()),
	('14', ' pode conter violência mais intensa, linguagem mais forte, temas adultos e situações que podem não ser adequadas para espectadores com menos de 14 anos', CURDATE()),
    ('16', ' pode conter violência intensa, linguagem mais pesada, conteúdo sexual, temas maduros', CURDATE()),
    ('18', 'é destinado apenas para adultos e pode conter violência extrema, linguagem explícita, cenas de sexo explícito, consumo de drogas, entre outros elementos que não são apropriados para espectadores menores de 18 anos.', CURDATE());
 -- SELECT * FROM tb_classificacao_indicativa;


-- 2 tb_categoria
INSERT INTO tb_categoria
(nome, dt_atualizacao)
VALUES 
('suspense', CURDATE()),
('ficção', CURDATE()),
('terror', CURDATE()),
('nacional', CURDATE()),
('drama', CURDATE()),
('comedia', CURDATE());
-- SELECT * FROM tb_categoria;


-- 3 tb_idioma
INSERT INTO tb_idioma 
(nome, dt_atualizacao)
VALUES
('português', CURDATE()),
('inglês', CURDATE()),
('espanhol', CURDATE()),
('coreano', CURDATE()),
('japones', CURDATE());
-- SELECT * FROM tb_idioma;




-- 4 tb_tipo_pagamento
INSERT INTO tb_tipo_pagamento
(categoria, dt_atualizacao)
VALUES
('cartão', CURDATE()),
('pix', CURDATE()),
('boleto', CURDATE()),
('deposito bancario', CURDATE()),
('WhatsApp Pay', CURDATE());
-- SELECT * FROM tb_tipo_pagamento;



-- 5 tb_país
INSERT INTO tb_pais
(nome, codigo,dt_atualizacao)
VALUES
('brasil', 'bra', CURDATE()),
('estados unidos', 'eua', CURDATE()), 
('espanha', 'esp', CURDATE()),
('japão', 'jpn', CURDATE()),
('coreia do sul', 'kor', CURDATE());
-- SELECT * FROM tb_pais;



-- 6 tb_plano
INSERT INTO tb_plano
(nome, valor, descricao, dt_atualizacao)
VALUES
('basico', 25.90 ,'resolução (HD), livre de anúncios, proporciona acesso ao catálogo 
completo e permite que você faça downloads em dispositivos para assistir offline.', CURDATE()),
('padrão', 39.99 , 'duas telas simultâneas, (Full HD). Ideal para compartilhar o acesso com outra pessoa em uma mesma residência. Além disso, é livre de anúncios, 
permite fazer o download dos conteúdos para assistir offline', CURDATE()),
('premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.',CURDATE());
 -- SELECT * FROM tb_plano;


-- 7 tb_ator
INSERT INTO tb_ator
(nome, sobrenome, dt_nascimento, foto, dt_atualizacao)
VALUES
	('Sandra', 'Bullock', '1964-07-26', 'https://exemplo.com/sandra_bullock.jpg', CURDATE()),
	('George', 'Clooney', '1961-05-06', 'https://exemplo.com/george_clooney.jpg', CURDATE()),
	('Mateus', 'Nascimento', '1979-06-08', 'https://exemplo.com/mateus_nascimento.jpg', CURDATE()),
	('Selton', 'Mello', '1972-12-30', 'https://exemplo.com/selton_mello.jpg', CURDATE()),
	('Matheus', 'Nachtigall', '1982-02-18', 'https://exemplo.com/matheus_nachtigall.jpg', CURDATE()),
	('Leandro', 'Firmino', '1978-06-23', 'https://exemplo.com/leandro_firmino.jpg', CURDATE()),
	('Masaki', 'Suda', '1993-02-21', 'https://exemplo.com/masaki_suda.jpg', CURDATE()),
	('Hana', 'Sugisaki', '1997-02-02', 'https://exemplo.com/hana_sugisaki.jpg', CURDATE()),
	('Ryo', 'Yoshizawa', '1994-02-01', 'https://exemplo.com/ryo_yoshizawa.jpg', CURDATE()),
	('Jo', 'Byung-gyu', '1996-04-23', 'https://exemplo.com/jo_byung_gyu.jpg', CURDATE()),
	('Yoon', 'Chan-young', '1997-11-09', 'https://exemplo.com/yoon_chan_young.jpg', CURDATE()),
	('Itziar', 'Ituño', '1974-06-18', 'https://exemplo.com/itziar_ituno.jpg', CURDATE());
-- SELECT * FROM tb_ator;



-- 8 tb_estado
INSERT INTO tb_estado
(nome, id_pais, dt_atualizacao)
VALUES
('tóquio','4', CURDATE()),
('seoul', '5', CURDATE()),
('brasilia','1', CURDATE()),
('madri', '3', CURDATE()),
('washington', '2', CURDATE());
-- SELECT * FROM tb_estado;



-- 9 tb_catalogo
INSERT INTO tb_catalogo
(titulo, ano_lancamento, duracao, descricao, imagem_capa , avaliacao, id_classificacao_indicativa, id_idioma_original, dt_atualizacao)
VALUES
	('gravidade', 2013, '01:31:00', 'Dra. Ryan Stone e o astronauta Matt Kowalsky trabalham juntos para sobreviver
depois que um acidente os deixa completamente à deriva no espaço, sem ligação com a Terra e sem esperança de resgate.',
'https://br.web.img3.acsta.net/pictures/210/232/21023259_20130729194021309.jpg', '4', 3, 2,CURDATE()),
	('o auto da compadecida', 2000, '01:44:00', 'As aventuras de João Grilo e Chicó, dois nordestinos pobres que vivem de golpes para sobreviver. 
Eles estão sempre enganando o povo de um pequeno vilarejo, inclusive o temido cangaceiro Severino de Aracaju, que os persegue pela região.',
'https://images-americanas.b2w.io/produtos/4959596043/imagens/dvd-duplo-o-auto-da-compadecida/4959596043_1_xlarge.jpg', '5', 3, 1, CURDATE()),
	('bleach', 2018, '01:48:00', 'O jovem Ichigo é surpreendido com indesejadas habilidades de ceifeiro de almas e quer devolver os poderes.
Mas deve executar algumas tarefas antes.', 'https://cdn.fstatic.com/media/movies/covers/2018/06/Cartaz_-_Bleach_live-action.jpg', '3', 3, 5, CURDATE()),
	('All Of Us Are Dead', 2022, '00:00:00', 'Uma epidemia mortal surge em uma escola. Encurralados, os alunos só tem uma opção: lutar com todas as forças para não virarem zumbis.',
'https://static.wikia.nocookie.net/dublagem/images/2/2f/All_Of_Us_Are_Dead.jpeg/revision/latest?cb=20220130000924&path-prefix=pt-br', '4', 6, 5, CURDATE()),
	('la casa de papel', 2017, '00:00:00', 'Oito ladrões se trancam com reféns na Casa da Moeda da Espanha. 
Seu líder manipula a polícia para realizar um plano que pode ser o maior roubo da história ou uma missão em vão.', 
'https://cdn.folhape.com.br/img/pc/1100/1/dn_arquivo/2021/08/pt-br-lcdp-s5-main-vertical-rgb-pre-2.jpg,', '5', 5, 3, CURDATE());
-- SELECT * FROM tb_catalogo;




-- 10 tb_filme
INSERT INTO tb_filme
(id_catalogo, oscar, dt_atualizacao)
VALUES
(2, 0, CURDATE()),
(3, 0, CURDATE()),
(1, 1, CURDATE());
-- SELECT * FROM tb_filme

-- 11 tb_catalogo_idioma
INSERT INTO tb_catalogo_idioma
(id_catalogo, id_idioma, dt_atualizacao)
VALUES
(5,1, CURDATE()), (5,2, CURDATE()), (5,3, CURDATE()), (5,4, CURDATE()), (5,5, CURDATE()),
(3,5, CURDATE()), (3,1, CURDATE()), (3,2, CURDATE()), (3,3, CURDATE()),
(1,1, CURDATE()), (1,2, CURDATE()), (1,3, CURDATE()), (1,4, CURDATE()), (1,5, CURDATE()),
(2,1, CURDATE()),
(4,1, CURDATE()), (4,2, CURDATE()), (4,3, CURDATE()), (4,4, CURDATE()), (4,5, CURDATE());
-- SELECT * FROM tb_catalogo;


-- 12 tb_pais_catalogo
INSERT INTO tb_pais_catalogo
(id_pais, id_catalogo, dt_atualizacao)
VALUES
(5,4, CURDATE()), (4,3, CURDATE()), (2,1, CURDATE()), (1,2, CURDATE()), (3,5, CURDATE());



/*
SELECT * FROM tb_pais;
SELECT * FROM tb_catalogo; 
SELECT c.titulo AS catalogo, p.nome AS pais FROM tb_pais_catalogo AS pc
JOIN tb_pais AS p ON p.id_pais = pc.id_pais
JOIN tb_catalogo AS c ON c.id_catalogo = pc.id_catalogo;
*/

-- 13 tb_endereco
INSERT INTO tb_endereco
(setor, numero_rua, complemento, numero_casa, cidade, id_pais, id_estado, dt_atualizacao)
VALUES
('oeste', 2, 'avenida das nações', 12, 'estrutural', 1, 3, CURDATE()),
('norte', 25, 'praca das garças',8, 'Konohagakure', 4, 1, CURDATE()),
('sul', 66, 'lugar nenhum', 7, 'Chamartín', 3, 4, CURDATE()),
('leste', 47, 'rua silveiro silva', 2, 'Waryong tomb', 5, 2, CURDATE()),
('oeste', 34, 'bairro pinheiros', 8, 'Brentwood', 2, 5, CURDATE());

-- DESCRIBE tb_endereco;
-- SELECT * FROM tb_endereco;
-- SELECT * FROM tb_pais;
-- SELECT * FROM tb_estado;

-- 14 tb_usuario
INSERT INTO tb_usuario 
(nome, sobrenome, email, data_nascimento, data_cadastro, senha, status, id_endereco, data_atualizacao)
VALUES 

('Alice', 'Smith', 'alice.smith@example.com', '1985-05-12','2023-06-16', MD5('p23sswrd'), 1, 2, CURDATE()),
('Robert', 'Johnson', 'robert.johnson@example.com', '1998-09-20', '2023-06-08', MD5('secure123'), 1, 3, CURDATE()),
('Arthur', 'Jinner', 'Arthur.Jinner@example.com', '2000-12-21', '2023-08-12', MD5('vnrevi342'), 1, 4, CURDATE()),
('Barbara', 'Jones', 'Barbara.Jones@example.com', '2002-07-08', '2023-10-16', MD5('4564rerg5'), 1, 5, CURDATE()),
('Joao', 'Mario', 'Joao.Mario@example.com', '2001-04-29', '2023-12-16', MD5('ifewbi542b'), 1, 5, CURDATE()),
('Bernado', 'Silva', 'Bernado.Silva@example.com', '1992-10-29', '2023-12-16', MD5('ahjkehf3j'), 1, 1, CURDATE());

-- SELECT * FROM tb_usuario;
-- SELECT * FROM tb_endereco;

-- 15 tb_funcionario
INSERT INTO tb_funcionario 
(id_usuario, foto, data_atualizacao)
VALUES 
(1, 'https://i.pinimg.com/236x/47/c8/e6/47c8e62006fb9b9a8867497f843aefba--john-cena.jpg', CURDATE()),
(2, 'https://i.pinimg.com/236x/f6/67/06/f66706e67fbf8332af7cc692834d44ca--peliculas-disney-alice-liddell.jpg', CURDATE()),
(3, 'https://i.pinimg.com/564x/1a/4b/ee/1a4bee35be954518a7cadf00e0d08157.jpg', CURDATE());

-- SELECT * FROM tb_funcionario

-- 16 tb_cliente
INSERT INTO tb_cliente 
	(id_usuario, id_plano, dt_vencimento_plano, dt_atualizacao)
VALUES 
	(4, 1, '2023-06-30', CURDATE()),
	(5, 3, '2023-06-30', CURDATE()),
	(6, 2, '2023-06-30', CURDATE());

-- SELECT * FROM tb_cliente


-- 17 tb_perfil
INSERT INTO tb_perfil (nome, foto, tipo, id_cliente, dt_atualizacao)
VALUES 
	('perfil_a', 'https://img.freepik.com/vetores-premium/avatar-homem-barba_96853-399.jpg?w=2000', 'adulto', 1, CURDATE()),
	('perfil_c', 'https://static.vecteezy.com/system/resources/previews/010/141/732/non_2x/hand-drawn-kid-cartoon-sign-design-free-png.png', 'crianca', 2, CURDATE()),
	('perfil_p', 'https://i.ytimg.com/vi/S3iFG37kPro/maxresdefault.jpg', 'personalizado', 3, CURDATE());

-- SELECT * FROM tb_perfil;


-- 18 tb_cartao_credito
INSERT INTO tb_cartao_credito (numero, data_vencimento, cod_seguranca, id_cliente, dt_atualizacao)
VALUES 
	('1234567890123456', '2025-02-06', '123', 2, CURDATE()), -- posso ter um cartão registrado, mas não usar ele, A PRINCIPIO
	('9876543210987654', '2024-12-09', '321', 1, CURDATE()),
	('1111222233334444', '2025-04-18', '456', 3, CURDATE());

-- SELECT * FROM tb_cartao_credito;



-- 19 tb_pagamento
INSERT INTO tb_pagamento (valor, dt_pagamento, id_cartao_credito, id_cliente, id_tipo_pagamento, dt_atualizacao)
VALUES 
(100.00, '2023-06-16 12:00:00', 2, 1, 1, CURDATE()),
(50.00, '2023-06-16 10:30:00',NULL , 2, 2, CURDATE()), -- se tipo pagamento <> 1, entao id_cartao_credito = NULL
(75.00, '2023-06-16 15:45:00',NULL , 3, 5, CURDATE());

-- SELECT * FROM tb_pagamento;



-- 20 tb_catalogo_categoria
INSERT INTO tb_catalogo_categoria (id_catalogo, id_categoria, dt_atualizacao)
VALUES 
(1,1, CURDATE()), (1,2, CURDATE()), (2,4, CURDATE()), (2,6, CURDATE()), (3,1, CURDATE()), (3,3, CURDATE()), 
(4,1, CURDATE()), (4,3, CURDATE()), (4,5, CURDATE()), (5,1, CURDATE()), (5,5, CURDATE());

-- SELECT * FROM tb_catalogo_categoria;


-- 21 Inserção na tabela tb_elenco (Associação entre atores e filmes)
INSERT INTO tb_elenco (id_catalogo, id_ator, dt_atualizacao)
VALUES
	(1, 1, CURDATE()), -- Filme gravidade, ator Sandra Bullock
	(1, 2, CURDATE()), -- Filme gravidade, ator George Clooney
	(2, 3, CURDATE()), -- Filme o auto da compadecida, ator Mateus Nascimento
	(2, 4, CURDATE()), -- Filme o auto da compadecida, ator Selton Mello
	(3, 5, CURDATE()), -- Filme bleach, ator Matheus Nachtigall
	(3, 6, CURDATE()), -- Filme bleach, ator Leandro Firmino
	(4, 7, CURDATE()), -- Filme All Of Us Are Dead, ator Masaki Suda
	(4, 8, CURDATE()), -- Filme All Of Us Are Dead, ator Hana Sugisaki
	(4, 9, CURDATE()), -- Filme All Of Us Are Dead, ator Ryo Yoshizawa
	(5, 10, CURDATE()), -- Filme la casa de papel, ator Jo Byung-gyu
	(5, 11, CURDATE()), -- Filme la casa de papel, ator Yoon Chan-young
	(5, 12, CURDATE()); -- Filme la casa de papel, ator Itziar Ituño


/*
SELECT CONCAT(a.nome, ' ', a.sobrenome), c.titulo FROM tb_elenco AS e
JOIN tb_ator AS a ON a.id_ator = e.id_ator
JOIN tb_catalogo AS c ON c.id_catalogo = e.id_catalogo;
*/



-- 22 tb_serie 
INSERT INTO tb_serie 
(id_catalogo, qtd_temporadas, qtd_episodios, dt_atualizacao)
VALUES 
(4, 0, 0, CURDATE()),
(5, 0, 0, CURDATE());


-- SELECT * FROM tb_SERIE;

-- 23 tb_temporada
INSERT INTO tb_temporada
(titulo, id_serie, descricao, duracao, qtd_episodio, dt_atualizacao)
VALUES
('1º', 1, 'Uma epidemia mortal surge em uma escola. Encurralados, os alunos só tem uma opção: lutar com todas as forças para não virarem zumbis.', '00:00:00', 0, CURDATE()),
('1º', 2, 'Um grupo de 8 assaltantes,invadindo a Casa da Moeda da Espanha,porém eles não entram pra roubar o cofre e sim para FABRICAR o próprio dinheiro', '00:00:00', 0, CURDATE()),
('2º', 2,'Oito ladrões se trancam com reféns na Casa da Moeda da Espanha. Seu líder manipula a polícia para realizar um plano. 
Será o maior roubo da história, ou uma missão em vão?', '00:00:00', 0,CURDATE());

-- SELECT * FROM tb_temporada;


-- 24 tb_episodio
INSERT INTO tb_episodio
(nome, numero, id_temporada, id_serie, duracao, dt_atualizacao)
VALUES
('Efectuar lo acordado', 1, 2, 2, '00:00:00', CURDATE()),
('Efectuar lo acordado', 2, 2, 2, '00:00:00', CURDATE()),
('Se acabaron las máscaras ', 1, 3, 2, '00:00:00', CURDATE()),
('Ataque zumbi na escola', 1, 1, 1, '00:00:00', CURDATE()),
('Esta escola está FEITO!', 2, 1, 1, '00:00:00', CURDATE());


-- SELECT * FROM tb_episodio;








