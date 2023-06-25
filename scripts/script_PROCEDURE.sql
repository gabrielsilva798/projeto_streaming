-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1
-- procedure INSERT sp_classificacao_indicativa
-- DROP PROCEDURE sp_insert_classificacao_indicativa;
DELIMITER //
CREATE PROCEDURE sp_insert_classificacao_indicativa(idade_valor ENUM('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
	BEGIN
    IF 
		(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_classificacao_indicativa
        (idade, descricao, dt_atualizacao)
        VALUES
        (LOWER(idade_valor),  LOWER(descricao_valor), CURDATE());
	END IF;
    END // 
DELIMITER ; 




-- Procedure UPDATE tb_classificacao_indicativa
-- DROP PROCEDURE sp_update_classificacao_indicativa;
DELIMITER //
CREATE PROCEDURE sp_update_classificacao_indicativa(valor_id INT, idade_valor enum('livre','10','12','14','16','18'), descricao_valor VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(descricao_valor IS NULL ) OR (fn_valida_texto(descricao_valor, 30)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_classificacao_indicativa SET idade = idade_valor, descricao = LOWER(descricao_valor), dt_atualizacao = 	CURDATE()
			WHERE id_classificacao_indicativa = valor_id;
		END IF;
    END //
DELIMITER ;

-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_update_classificacao_indicativa(1, 'livre','O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.'); 

-- Procedure DELETE tb_classificacao_indicativa
DELIMITER //
CREATE PROCEDURE sp_delete_classificacao_indicativa (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao_indicativa
		WHERE id_classificacao_indicativa = valor_id;
	END IF;
END //
DELIMITER ;

-- DESCRIBE tb_classificacao_indicativa;
-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_delete_classificacao_indicativa(9);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2
-- Porcedure INSERT tb_categoria
-- DROP PROCEDURE sp_insert_categoria
DELIMITER //
CREATE PROCEDURE sp_insert_categoria(nome_categoria VARCHAR(45))
	BEGIN
    IF 
		(nome_categoria IS NULL ) OR (fn_valida_texto(nome_categoria, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_categoria
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_categoria), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_categoria;


-- SELECT * FROM tb_categoria;


-- Procedure UPDATE tb_categoria
-- DROP PROCEDURE sp_update_categoria;
DELIMITER //
CREATE PROCEDURE sp_update_categoria(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_categoria SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_categoria = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;

-- CALL sp_update_categoria(4, 'NACIONAL' );


-- Procedure DELETE tb_categoria
-- DROP PROCEDURE sp_delete_categoria;
DELIMITER //
CREATE PROCEDURE sp_delete_categoria (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END //
DELIMITER ;


-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;
-- CALL sp_delete_categoria(6);




-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3
-- Procedure INSERT tb_idioma
-- DROP PROCEDURE sp_insert_idioma;
DELIMITER //
CREATE PROCEDURE sp_insert_idioma(nome_idioma VARCHAR(45))
	BEGIN
    IF 
		(nome_idioma IS NULL ) OR (fn_valida_texto(nome_idioma, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_idioma
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_idioma), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;




-- Procedure UPDATE tb_idioma
-- DROP PROCEDURE sp_update_idioma;
DELIMITER //
CREATE PROCEDURE sp_update_idioma(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_idioma SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_idioma = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;

-- CALL sp_update_idioma(1, 'po');


-- Procedure DELETE tb_idioma
-- DROP PROCEDURE sp_delete_idioma;
DELIMITER //
CREATE PROCEDURE sp_delete_idioma (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END //
DELIMITER ;

-- SELECT * FROM tb_idioma;
-- CALL sp_delete_idioma(5);




-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4
-- Procedure INSERT tb_tipo_pagamento
-- DROP PROCEDURE sp_insert_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_insert_tipo_pagamento(nome_valor VARCHAR(30))
	BEGIN
    IF 
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) < 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_tipo_pagamento
        (categoria, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;


-- Procedure UPDATE tb_tipo_pagamento
-- DROP PROCEDURE sp_update_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_update_tipo_pagamento(valor_id INT, nome_valor VARCHAR(30))
	BEGIN
		IF NOT EXISTS
			(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSE
			UPDATE tb_tipo_pagamento SET categoria = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_tipo_pagamento = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;
-- CALL sp_update_tipo_pagamento(1,'cartão');



-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_delete_tipo_pagamento(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END //
DELIMITER ;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5
-- Procedure INSERT tb_país
-- DROP PROCEDURE sp_insert_pais;
DELIMITER //
CREATE PROCEDURE sp_insert_pais(nome_valor VARCHAR(45), cod_pais CHAR(3))
	BEGIN
	IF
		(cod_pais IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) >3) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere invalida';
	ELSEIF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
    ELSE
		INSERT INTO tb_pais
        (nome, codigo, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), LOWER(cod_pais), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;



-- Procedure UPDATE tb_país
-- DROP PROCEDURE sp_update_pais;
DELIMITER //
CREATE PROCEDURE sp_update_pais(valor_id INT, nome_valor VARCHAR(45), cod_pais CHAR(3))
	BEGIN
		IF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_pais muito curto';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(cod_pais, 2) = 0) OR (LENGTH(cod_pais) > 3 ) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere (id_pais) invalida';
		ELSE
			UPDATE tb_pais SET nome = LOWER(nome_valor), codigo = cod_pais, dt_atualizacao = CURDATE()
			WHERE id_pais = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;
-- CALL sp_update_pais(1,'BRASÍL', 'BRA');

-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_pais;
DELIMITER //
CREATE PROCEDURE sp_delete_pais(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6
-- Procedure INSERT tb_plano
-- DROP PROCEDURE sp_insert_plano;
DELIMITER //
CREATE PROCEDURE sp_insert_plano(nome_valor VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
	BEGIN
	IF
		(descricao_plano IS NULL ) OR (fn_valida_texto(nome_valor, 3 )) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(valor_plano IS NULL ) OR (valor_plano NOT BETWEEN 20.00 AND 100.00) THEN -- valor máximo e mínimo de planos no momento
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
	ELSEIF
		(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
    ELSE
		INSERT INTO tb_plano
        (nome, valor, descricao, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), valor_plano, LOWER(descricao_plano), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;






-- Procedure UPDATE tb_plano
-- DROP PROCEDURE sp_update_plano;
DELIMITER //
CREATE PROCEDURE sp_update_plano(valor_id INT, nome_valor VARCHAR(45), preco FLOAT, descricao_plano  VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
        ELSEIF
			(preco IS NULL ) OR (preco NOT BETWEEN 20.00 AND 100.00) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 99 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_plano SET nome = LOWER(nome_valor), valor = preco, descricao = LOWER(descricao_plano) , dt_atualizacao = CURDATE()
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;

-- CALL sp_update_plano(3 , 'premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');






-- Procedure DELETE tb_plano
-- DROP PROCEDURE sp_delete_plano;
DELIMITER //
CREATE PROCEDURE sp_delete_plano(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END //
DELIMITER ;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7
-- Procedure INSERT tb_ator
-- DROP PROCEDURE sp_insert_ator;
DELIMITER //
CREATE PROCEDURE sp_insert_ator(nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
	IF
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
	ELSEIF
		(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
	ELSEIF
		nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
    ELSEIF
		(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
	ELSE
		INSERT INTO tb_ator
        (nome, sobrenome, dt_nascimento, foto, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), LOWER(sobrenome_valor), nascimento, foto_ator , CURDATE());
	END IF;
    END // 
DELIMITER ; 


-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;

-- Procedure UPDATE tb_ator
-- DROP PROCEDURE sp_update_ator;
DELIMITER //
CREATE PROCEDURE sp_update_ator(valor_id INT, nome_valor VARCHAR(45), sobrenome_valor VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome muito curto';
		ELSEIF
			(sobrenome_valor IS NULL ) OR (fn_valida_texto(sobrenome_valor, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome muito curto';
		ELSEIF
			nascimento NOT BETWEEN '1800-01-01' AND CURDATE() THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
		ELSEIF
			(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 9)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
		ELSE
			UPDATE tb_ator SET nome = LOWER(nome_valor), sobrenome = LOWER(sobrenome_valor), dt_nascimento = nascimento , foto = foto_ator, dt_atualizacao = CURDATE()
			WHERE id_ator = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;

-- CALL sp_update_ator(5,'ED', 'Harris', '1950-11-28', 'https://m.media-amazon.com/images/M/MV5BMjE4NDM4ODc2OV5BMl5BanBnXkFtZTcwNzA5NjQ5MQ@@._V1_FMjpg_UX1000_.jpg')


-- Procedure DELETE tb_ator
-- DROP PROCEDURE sp_delete_ator;
DELIMITER //
CREATE PROCEDURE sp_delete_ator(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END //
DELIMITER ;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 8 
-- Procedure INSERT tb_estado
-- DROP PROCEDURE sp_insert_estado;
DELIMITER //
CREATE PROCEDURE sp_insert_estado(nome_estado VARCHAR(45), cod_pais INT)
	BEGIN
    IF
		(nome_estado IS NULL ) OR (fn_valida_texto(nome_estado, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_estado muito curto';
    ELSEIF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = cod_pais) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
    ELSE
		INSERT INTO tb_estado
        (nome, id_pais, dt_atualizacao)
        VALUES
        (LOWER(nome_estado), cod_pais, CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_estado;
-- SELECT * FROM tb_estado;



-- Procedure UPDATE tb_estado
-- DROP PROCEDURE sp_update_estado;
DELIMITER //
CREATE PROCEDURE sp_update_estado(valor_id INT,nome_estado VARCHAR(45), cod_pais INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_estado FROM tb_estado WHERE id_estado = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_estado IS NULL ) OR (fn_valida_texto(nome_estado, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_estado muito curto';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = cod_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSE
			UPDATE tb_estado SET nome = LOWER(nome_estado), id_pais = cod_pais, dt_atualizacao = CURDATE()
			WHERE id_estado = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_estado;
-- SELECT * FROM tb_estado;
-- CALL sp_update_estado(5, 'washington', '2')




-- Procedure DELETE tb_estado
-- DROP PROCEDURE sp_delete_estado;
DELIMITER //
CREATE PROCEDURE sp_delete_estado(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_estado FROM tb_estado WHERE id_estado = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_estado
		WHERE id_estado = valor_id;
	END IF;
END //
DELIMITER ;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 9
-- Procedure INSERT tb_catalogo
-- DROP PROCEDURE sp_insert_catalogo;
DELIMITER //
CREATE PROCEDURE sp_insert_catalogo(nome_catalogo VARCHAR(45), lancamento YEAR, tempo TIME, valo_descricao VARCHAR(255), capa VARCHAR(200), 
avaliacao_ct ENUM('1','2','3','4','5'), classificacao_indicativa INT, idioma_original INT)
	BEGIN
		IF
			fn_valida_texto(nome_catalogo, 0) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
		ELSEIF
			(lancamento IS NULL) OR (lancamento NOT BETWEEN 1894 AND YEAR(CURDATE()))  THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ano_lancamento invalido';
		ELSEIF
			(valo_descricao IS NULL ) OR (fn_valida_texto(valo_descricao, 110 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSEIF
			(capa  IS NULL ) OR (fn_valida_texto(capa, 6 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'LINK da imagem_capa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = classificacao_indicativa) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_classificacao_indicativa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = idioma_original) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma_original invalido';
		ELSE
			INSERT INTO tb_catalogo
			(titulo, ano_lancamento, duracao, descricao, imagem_capa , avaliacao, id_classificacao_indicativa, id_idioma_original, dt_atualizacao)
			VALUES
			(LOWER(nome_catalogo), lancamento, tempo, LOWER(valo_descricao), capa, 
			avaliacao, classificacao_indicativa, idioma_original, CURDATE());
		END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_catalogo;
-- zSELECT * FROM tb_catalogo;




-- Procedure UPDATE tb_catalogo
-- DROP PROCEDURE sp_update_catalogo;
DELIMITER //
CREATE PROCEDURE sp_update_catalogo(valor_id INT, nome_catalogo VARCHAR(45), lancamento YEAR, tempo TIME, valo_descricao VARCHAR(255), capa VARCHAR(200), 
avaliacao_ct ENUM('1','2','3','4','5'), classificacao_indicativa INT, idioma_original INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			fn_valida_texto(nome_catalogo, 0) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
		ELSEIF
			(lancamento IS NULL) OR (lancamento NOT BETWEEN 1894 AND YEAR(CURDATE()))  THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ano_lancamento invalido';
		ELSEIF
			(valo_descricao IS NULL ) OR (fn_valida_texto(valo_descricao, 50 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSEIF
			(capa  IS NULL ) OR (fn_valida_texto(capa, 6 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'LINK da imagem_capa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_classificacao_indicativa FROM tb_classificacao_indicativa WHERE id_classificacao_indicativa = classificacao_indicativa) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_classificacao_indicativa invalida';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = idioma_original) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma_original invalido';
		ELSE
			UPDATE tb_catalogo SET titulo = LOWER(nome_catalogo), ano_lancamento = lancamento, duracao = tempo, descricao = valo_descricao,
				imagem_capa = capa, avaliacao = avaliacao_ct, id_classificacao_indicativa = classificacao_indicativa, id_idioma_original = id_idioma_original
			WHERE id_catalogo = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE  tb_catalogo;
-- SELECT * FROM tb_catalogo;


 
-- Procedure DELETE tb_estado
-- DROP PROCEDURE sp_delete_estado;
DELIMITER //
CREATE PROCEDURE sp_delete_catalogo(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_catalogo
		WHERE id_catalogo = valor_id;
	END IF;
END //
DELIMITER ;


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10
-- Procedure INSERT tb_filme
DELIMITER //
CREATE PROCEDURE sp_insert_filme(id_do_catalogo INT, possui_oscar BOOLEAN)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(possui_oscar IS NULL ) OR (possui_oscar NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna oscar só pode assumir valores 0 ou 1';
		ELSE
			INSERT INTO tb_filme
			(id_catalogo, oscar, dt_atualizacao)
			VALUES
			(id_do_catalogo, possui_oscar, CURDATE());
		END IF;
    END // 
DELIMITER ;


-- SELECT * FROM tb_filme;
-- DESCRIBE tb_filme;
/*
CALL sp_insert_filme(2,0);
CALL sp_insert_filme(3,0);
CALL sp_insert_filme(1,1);
*/





-- Procedure UPDATE tb_filme
DELIMITER //
CREATE PROCEDURE sp_update_filme(valor_id INT, id_do_catalogo INT, possui_oscar BOOLEAN)
	BEGIN
		IF NOT EXISTS
			(SELECT id_filme FROM tb_filme WHERE id_filme = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_filme invalido';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(possui_oscar IS NULL ) OR (possui_oscar NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna oscar só pode assumir valores 0 ou 1';
		ELSE
			UPDATE tb_filme SET id_catalogo = id_do_catalogo, oscar = possui_oscar, dt_atualizacao = CURDATE()
			WHERE id_filme = valor_id;
		END IF;
    END // 
DELIMITER ;



-- SELECT * FROM tb_filme;
-- DESCRIBE tb_filme;






-- Procedure DELETE tb_filme
-- DROP PROCEDURE sp_delete_filme;
DELIMITER //
CREATE PROCEDURE sp_delete_filme(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_filme FROM tb_filme WHERE id_filme = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_filme
		WHERE id_filme = valor_id;
	END IF;
END //
DELIMITER ;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 11
-- Procedure INSERT tb_catalogo_idioma
DELIMITER //
CREATE PROCEDURE sp_insert_catalogo_idioma(id_do_catalogo INT, id_do_idioma INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma invalido';
		ELSEIF EXISTS
			(SELECT id_idioma, id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = id_do_catalogo AND id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			INSERT INTO tb_catalogo_idioma
			(id_catalogo, id_idioma, dt_atualizacao)
			VALUES
			(id_do_catalogo, id_do_idioma, CURDATE());
		END IF;
    END // 
DELIMITER ;


-- SELECT * FROM tb_catalogo_idioma;
-- DESCRIBE tb_catalogo_idioma;
/*
CALL sp_insert_catalogo_idioma(5,1);
CALL sp_insert_catalogo_idioma(5,2);
*/



-- DROP PROCEDURE sp_update_catalogo_idioma;
-- Procedure UPDATE tb_catalogo_idioma
DELIMITER //
CREATE PROCEDURE sp_update_catalogo_idioma(valor_id_catalogo INT, valor_id_idioma INT, id_do_catalogo INT, id_do_idioma INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_catalogo_idioma';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_catalogo_idioma WHERE id_idioma = valor_id_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_idioma é inexistente em tb_catalogo_idioma';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_idioma não existe na tabela de origem - tb_idioma';
		ELSEIF EXISTS
			(SELECT id_idioma, id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = id_do_catalogo AND id_idioma = id_do_idioma) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_catalogo_idioma SET id_catalogo = id_do_catalogo, id_idioma = id_do_idioma, dt_atualizacao = CURDATE()
			WHERE id_catalogo = valor_id_catalogo AND id_idioma = valor_id_idioma;
		END IF;
    END // 
DELIMITER ;


-- SELECT * FROM tb_catalogo_idioma;
-- DESCRIBE tb_catalogo_idioma;

-- CALL sp_update_catalogo_idioma(5,2,5,1);




-- Procedure DELETE tb_catalogo_idioma
-- DROP PROCEDURE sp_delete_catalogo_idioma;
DELIMITER //
CREATE PROCEDURE sp_delete_catalogo_idioma(valor_id_catalogo INT, valor_id_idioma INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo_idioma WHERE id_catalogo = valor_id_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_idioma FROM tb_catalogo_idioma WHERE id_idioma = valor_id_idioma) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_idioma invalido';
    ELSE
		DELETE FROM  tb_catalogo_idioma
		WHERE id_catalogo = valor_id_catalogo AND id_idioma = valor_id_idioma;
	END IF;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 12
-- Procedure INSERT tb_pais_catalogo
-- DROP PROCEDURE sp_insert_pais_catalogo
DELIMITER //
CREATE PROCEDURE sp_insert_pais_catalogo(id_do_pais INT, id_do_catalogo INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSEIF EXISTS
			(SELECT id_pais, id_catalogo FROM tb_pais_catalogo WHERE id_pais = id_do_pais AND id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			INSERT INTO tb_pais_catalogo
			(id_pais, id_catalogo, dt_atualizacao)
			VALUES
			(id_do_pais, id_do_catalogo, CURDATE());
		END IF;
    END // 
DELIMITER ;

-- SELECT * FROM tb_pais_catalogo;
-- DESCRIBE tb_pais_catalogo;
/*
CALL sp_insert_pais_catalogo(5,4);
CALL sp_insert_pais_catalogo(4,3);
*/








-- Procedure UPDATE tb_pais_catalogo
-- DROP PROCEDURE sp_update_pais_catalogo;
DELIMITER //
CREATE PROCEDURE sp_update_pais_catalogo(valor_id_pais INT, valor_id_catalogo INT, id_do_pais INT, id_do_catalogo INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_pais_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais_catalogo WHERE id_pais = valor_id_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_pais é inexistente em tb_pais_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_pais não existe na tabela de origem - tb_pais';
		ELSEIF EXISTS
			(SELECT id_pais, id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = id_do_catalogo AND id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_pais_catalogo SET id_pais = id_do_pais, id_catalogo = id_do_catalogo, dt_atualizacao = CURDATE()
			WHERE  id_pais = valor_id_pais AND id_catalogo = valor_id_catalogo;
		END IF;
    END // 
DELIMITER ;
			
        


-- SELECT * FROM tb_pais_catalogo;
-- DESCRIBE tb_pais_catalogo;
/*
CALL sp_update_pais_catalogo(5,4,5,3);
CALL sp_update_pais_catalogo(4,3);
*/





-- Procedure DELETE tb_pais_catalogo
-- DROP PROCEDURE sp_delete_pais_catalogo;
DELIMITER //
CREATE PROCEDURE sp_delete_pais_catalogo(valor_id_pais INT, valor_id_catalogo INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_pais_catalogo WHERE id_catalogo = valor_id_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_pais FROM tb_pais_catalogo WHERE id_pais = valor_id_pais) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
	ELSE
		DELETE FROM  tb_pais_catalogo
		WHERE id_pais = valor_id_pais AND id_catalogo = valor_id_catalogo;
	END IF;
END //
DELIMITER ;

-- SELECT * FROM tb_pais_catalogo;
-- DESCRIBE tb_pais_catalogo;
/*
CALL sp_delete_pais_catalogo(4,3);
*/
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 13
-- Procedure INSERT tb_endereco
-- DROP PROCEDURE sp_insert_endereco;
DELIMITER //
CREATE PROCEDURE sp_insert_endereco(v_setor VARCHAR(45), n_rua INT, v_complemento VARCHAR(45), n_casa INT, v_cidade VARCHAR(45), 
id_do_pais INT, id_do_estado INT)
	BEGIN
		IF
			(v_setor  IS NULL ) OR (fn_valida_texto(v_setor, 3 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do setor muito curto';
		ELSEIF
			(v_complemento  IS NULL ) OR (fn_valida_texto(v_complemento, 5 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do complemento muito curto';
		ELSEIF
			(v_cidade IS NULL ) OR (fn_valida_texto(v_cidade, 2 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome da cidade muito curto';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSEIF NOT EXISTS
			(SELECT id_estado FROM tb_estado WHERE id_estado = id_do_estado) AND (id_do_estado IS NOT NULL) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_estado invalido';
		ELSE
			INSERT INTO tb_endereco
			(setor, numero_rua, complemento, numero_casa, cidade, id_pais, id_estado, dt_atualizacao)
			VALUES
			(LOWER(v_setor), n_rua, LOWER(v_complemento), n_casa, LOWER(v_cidade), id_do_pais, id_do_estado, CURDATE());
		END IF;
	END //
DELIMITER ;

-- DESCRIBE tb_endereco;
-- SELECT * FROM tb_endereco;






-- Procedure UPDATE tb_endereco
DELIMITER //
CREATE PROCEDURE sp_update_endereco(valor_id INT, v_setor VARCHAR(45), n_rua INT, v_complemento VARCHAR(45), n_casa INT, v_cidade VARCHAR(45), 
id_do_pais INT, id_do_estado INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
		ELSEIF
			(v_setor  IS NULL ) OR (fn_valida_texto(v_setor, 3 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do setor muito curto';
		ELSEIF
			(v_complemento  IS NULL ) OR (fn_valida_texto(v_complemento, 5 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome do complemento muito curto';
		ELSEIF
			(v_cidade IS NULL ) OR (fn_valida_texto(v_cidade, 2 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome da cidade muito curto';
		ELSEIF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = id_do_pais) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pais invalido';
		ELSEIF NOT EXISTS
			(SELECT id_estado FROM tb_estado WHERE id_estado = id_do_estado) AND (id_do_estado IS NOT NULL) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_estado invalido';
		ELSE
			UPDATE tb_endereco SET setor= v_setor, numero_rua = n_rua, complemento = v_complemento, numero_casa = n_casa,
				cidade = v_cidade, id_pais = id_do_pais, id_estado = id_do_estado, dt_atualizacao = CURDATE()
			WHERE id_endereco = valor_id;
		END IF;
    END // 
DELIMITER ;


-- SELECT * FROM tb_endereco;


-- Procedure DELETE tb_endereco
-- DROP PROCEDURE sp_delete_endereco;
DELIMITER //
CREATE PROCEDURE sp_delete_endereco(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_endereco FROM tb_endereco WHERE id_endereco = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID inexistente';
    ELSE
		DELETE FROM  tb_endereco
		WHERE id_endereco = valor_id;
	END IF;
END //
DELIMITER ;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												-- TESTAR DAQUI EM DIANTE AINDA
												-- TESTAR DAQUI EM DIANTE AINDA
												-- TESTAR DAQUI EM DIANTE AINDA
-- 14
-- Procedure INSERT tb_usuario 
-- DROP PROCEDURE sp_insert_usuario;
DELIMITER //
CREATE PROCEDURE sp_insert_usuario(valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
dt_cadastro DATE, valor_senha VARCHAR(255), v_status BOOLEAN, id_do_endereco INT)
	BEGIN
		IF
			(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(valor_sobrenome IS NULL ) OR (fn_valida_texto(valor_sobrenome, 2)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
		ELSEIF
			(valor_email IS NULL ) OR (fn_valida_texto(valor_email, 5) = 0) OR 
            (INSTR(valor_email,'@') = 0) OR (INSTR(valor_email,'.') = 0) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'email invalido';
		ELSEIF
			dt_nascimento NOT BETWEEN (DATE_ADD(CURDATE(), INTERVAL -100 YEAR)) AND (DATE_ADD(CURDATE(), INTERVAL -16 YEAR)) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de nascimento fora de parametro';
		ELSEIF
			dt_cadastro NOT BETWEEN '2023-06-16' AND CURDATE() THEN -- data de criacao do banco, não tem como se cadastrar antes disso
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de cadastro invalida';
		ELSEIF
			(valor_senha IS NULL ) OR (fn_valida_texto(valor_senha, 7)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'senha deve conter no mínimo 8 digitos';
		ELSEIF
			(v_status IS NULL ) OR (v_status NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna status só pode assumir valores 0 ou 1';
		ELSEIF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_endereco invalido';
		ELSE
			INSERT INTO tb_usuario
            (nome, sobrenome, email, data_nascimento, data_cadastro, senha, status, id_endereco, data_atualizacao)
            VALUES
            (LOWER(valor_nome), LOWER(valor_sobrenome), valor_email, dt_nascimento, dt_cadastro, MD5(valor_senha), v_status, id_do_endereco, CURDATE());
		END IF;
	END //
DELIMITER ;

-- DESCRIBE tb_usuario;
-- SELECT * FROM tb_usuario ;

-- CALL sp_insert_usuario('John', 'Doe', 'john.doe@example.com', '1922-01-01', CURDATE(), 'password123', 1, 1);









-- Procedure UPDATE tb_usuario 
-- DROP PROCEDURE sp_update_usuario;
DELIMITER //
CREATE PROCEDURE sp_update_usuario(valor_id INT, valor_nome VARCHAR(45), valor_sobrenome VARCHAR(45), valor_email VARCHAR(45), dt_nascimento DATE, 
dt_cadastro DATE, valor_senha VARCHAR(255), v_status BOOLEAN, id_do_endereco INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 1)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(valor_sobrenome IS NULL ) OR (fn_valida_texto(valor_sobrenome, 2)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
		ELSEIF
			(valor_email IS NULL ) OR (fn_valida_texto(valor_email, 5) = 0) OR 
            (INSTR(valor_email,'@') = 0) OR (INSTR(valor_email,'.') = 0) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'email invalido';
		ELSEIF
			dt_nascimento < DATE_ADD(CURDATE(), INTERVAL -100 YEAR)  OR dt_nascimento > DATE_ADD(CURDATE(), INTERVAL -16 YEAR) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de nascimento fora de parametro';
		ELSEIF
			dt_cadastro NOT BETWEEN '2023-06-16' AND CURDATE() THEN -- data de criacao do banco, não tem como se cadastrar antes disso
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de cadastro invalida';
		ELSEIF
			(valor_senha IS NULL ) OR (fn_valida_texto(valor_senha, 7)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'senha deve conter no mínimo 8 digitos';
		ELSEIF
			(v_status IS NULL ) OR (v_status NOT BETWEEN 0 AND 1) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'coluna status só pode assumir valores 0 ou 1';
		ELSEIF NOT EXISTS
			(SELECT id_endereco FROM tb_endereco WHERE id_endereco = id_do_endereco) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_endereco invalido';
		ELSE
			UPDATE tb_usuario SET valor_nome = nome, valor_sobrenome = sobrenome, valor_email = email, dt_nascimento = data_nasciemento, 
			dt_cadastro = data_cadastro, valor_senha = senha, v_status = status, id_do_endereco = id_endereco, dt_atualizacao = CURDATE()
			WHERE id_usuario = valor_id;
		END IF;
    END // 
DELIMITER ;


-- DESCRIBE tb_usuario;
-- SELECT * FROM tb_usuario ;













-- Procedure DELETE tb_usuario
-- DROP PROCEDURE sp_delete_usuario;
DELIMITER //
CREATE PROCEDURE sp_delete_usuario(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_usuario FROM tb_usuario WHERE id_usuario = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_usuario
		WHERE id_usuario = valor_id;
	END IF;
END //
DELIMITER ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 15
-- Procedure INSERT tb_funcionario
-- DROP PROCEDURE sp_insert_funcionario;
DELIMITER //
CREATE PROCEDURE sp_insert_funcionario(id_do_usuario INT, foto_usuario VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(foto_usuario IS NULL ) OR (fn_valida_texto(foto_usuario, 5)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
		ELSE
			INSERT INTO tb_funcionario
            (id_usuario, foto, data_atualizacao)
            VALUES
            (id_do_usuario, foto_usuario, CURDATE());
		END IF;
	END //
DELIMITER ;


-- DESCRIBE tb_funcionario;
-- SELECT * FROM tb_funcionario;

-- CALL sp_insert_funcionario(1, 'https://i.pinimg.com/236x/47/c8/e6/47c8e62006fb9b9a8867497f843aefba--john-cena.jpg');









-- Procedure UPDATE tb_funcionario 
-- DROP PROCEDURE sp_update_usuario;
DELIMITER //
CREATE PROCEDURE sp_update_funcionario(valor_id INT, id_do_usuario INT, foto_usuario VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_funcionario FROM tb_funcionario WHERE id_funcionario = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_funcionario invalido';
		ELSEIF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF
			(foto_usuario IS NULL ) OR (fn_valida_texto(foto_usuario, 5)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
		ELSE
			UPDATE tb_funcionario SET id_usuario = id_do_usuario,foto = foto_usuario, dt_atualizacao = CURDATE()
			WHERE id_funcionario = valor_id;
		END IF;
    END // 
DELIMITER ;




-- DESCRIBE tb_funcionario;
-- SELECT * FROM tb_funcionario;








-- Procedure DELETE tb_funcionario
-- DROP PROCEDURE sp_delete_funcionario;
DELIMITER //
CREATE PROCEDURE sp_delete_funcionario(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_funcionario FROM tb_funcionario WHERE id_funcionario = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_funcionario
		WHERE id_funcionario = valor_id;
	END IF;
END //
DELIMITER ;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 16
-- Procedure INSERT tb_cliente
-- DROP PROCEDURE sp_insert_cliente;
DELIMITER //
CREATE PROCEDURE sp_insert_cliente(id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
BEGIN
	IF NOT EXISTS
		(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
	ELSEIF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = id_do_plano) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_plano invalido';
	ELSEIF
		(vencimento_plano IS NULL) OR (vencimento_plano < DATE_ADD(CURDATE(), INTERVAL 30 DAY)) THEN -- 30 DIAS de prazo minimo
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do plano invalida';
	ELSE
		INSERT INTO tb_cliente
		(id_usuario, id_plano, dt_vencimento_plano, dt_atualizacao)
		VALUES
		(id_do_usuario, id_do_plano, vencimento_plano, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_cliente;
-- SELECT * FROM tb_cliente;

-- CALL sp_insert_cliente(4, 1, '2023-09-28');





-- Procedure UPDATE tb_cliente 
-- DROP PROCEDURE sp_update_cliente;
DELIMITER //
CREATE PROCEDURE sp_update_cliente(valor_id INT, id_do_usuario INT, id_do_plano INT, vencimento_plano DATE)
	BEGIN
		IF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSEIF NOT EXISTS
			(SELECT id_usuario FROM tb_usuario WHERE id_usuario = id_do_usuario) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_usuario invalido';
		ELSEIF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = id_do_plano) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_plano invalido';
		ELSEIF
			(vencimento_plano IS NULL) OR (vencimento_plano < DATE_ADD(CURDATE(), INTERVAL 30 DAY)) THEN -- 30 DIAS de prazo minimo
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do plano invalida';
		ELSE
			UPDATE tb_cliente SET id_do_usuario = id_usuario, id_do_plano = id_plano, vencimento_plano = dt_vencimento_plano, dt_atualizacao = CURDATE()
			WHERE id_cliente = valor_id;
		END IF;
    END // 
DELIMITER ;
			




-- DESCRIBE tb_cliente;
-- SELECT * FROM tb_cliente;



-- Procedure DELETE tb_funcionario
-- DROP PROCEDURE sp_delete_funcionario;
DELIMITER //
CREATE PROCEDURE sp_delete_cliente(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_cliente
		WHERE id_cliente = valor_id;
	END IF;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 17
-- Procedure INSERT tb_perfil
-- DROP PROCEDURE sp_insert_perfil;
DELIMITER //
CREATE PROCEDURE sp_insert_perfil(valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
BEGIN
	IF
		(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
    ELSEIF
		(valor_foto IS NULL ) OR (fn_valida_texto(valor_foto, 5)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
    ELSE
		INSERT INTO tb_perfil
		(nome, foto, tipo, id_cliente, dt_atualizacao)
		VALUES
		(LOWER(valor_nome), valor_foto, LOWER(valor_tipo), id_do_cliente, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_perfil;
-- SELECT * FROM tb_perfil;







-- Procedure UPDATE tb_perfil 
-- DROP PROCEDURE sp_update_perfil;
DELIMITER //
CREATE PROCEDURE sp_update_perfil(valor_id INT, valor_nome VARCHAR(45), valor_foto VARCHAR(255), valor_tipo enum('adulto','crianca','personalizado'), id_do_cliente INT)
	BEGIN
	IF NOT EXISTS
		(SELECT id_perfil FROM tb_perfil WHERE id_perfil = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_perfil invalido';
	ELSEIF
		(valor_nome IS NULL ) OR (fn_valida_texto(valor_nome, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
    ELSEIF
		(valor_foto IS NULL ) OR (fn_valida_texto(valor_foto, 5)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Link da foto invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
    ELSE
			UPDATE tb_perfil SET nome = valor_nome, foto = valor_foto, tipo = valor_tipo, id_cliente = id_do_cliente, dt_atualizacao = CURDATE()
			WHERE id_perfil = valor_id;
		END IF;
    END // 
DELIMITER ;





-- DESCRIBE tb_perfil;
-- SELECT * FROM tb_perfil;










-- Procedure DELETE tb_perfil
-- DROP PROCEDURE sp_delete_perfil;
DELIMITER //
CREATE PROCEDURE sp_delete_perfil(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_perfil FROM tb_perfil WHERE id_perfil = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_perfil
		WHERE id_perfil = valor_id;
	END IF;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 18
-- Procedure INSERT tb_cartao_credito
-- DROP PROCEDURE sp_cartao_credito;
DELIMITER //
CREATE PROCEDURE sp_insert_cartao_credito(num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
BEGIN
	IF
		(num IS NULL ) OR (SELECT INSTR(fn_remover_acento(num), ' ') = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca invalido';
	ELSEIF
		(vencimento IS NULL) OR (vencimento <= CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do cartao invalida';
	ELSEIF
		(num_seguranca IS NULL ) OR ((fn_valida_texto(num_seguranca, 2)) = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	 ELSE
		INSERT INTO cartao_credito
		(num, vencimento, num_seguranca, id_do_cliente, dt_atualizacao)
		VALUES
		(numero, data_vencimento, cod_seguranca, id_cliente, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_cartao_credito;
-- SELECT * FROM tb_cartao_credito;








-- Procedure UPDATE tb_cartao_credito 
-- DROP PROCEDURE sp_update_cartao_credito;
DELIMITER //
CREATE PROCEDURE sp_update_cartao_credito(valor_id INT, num CHAR(19), vencimento DATE, num_seguranca CHAR(3), id_do_cliente INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSEIF
			(num IS NULL ) OR (SELECT INSTR(fn_remover_acento(num), ' ') = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca invalido';
		ELSEIF
			(vencimento IS NULL) OR (vencimento <= CURDATE()) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de vencimento do cartao invalida';
		ELSEIF
			(num_seguranca IS NULL ) OR ((fn_valida_texto(num_seguranca, 2)) = 0) OR (LOWER(num_seguranca) BETWEEN 'a' AND 'z') THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'cod_seguranca pode ter somente 3 digitos numericos';
		ELSEIF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSE
			UPDATE tb_cartao_credito SET numero = num, data_vencimento = vencimento, cod_seguranca = num_seguranca, id_cliente = id_do_cliente, dt_atualizacao = CURDATE()
			WHERE id_cartao = valor_id;
		END IF;
    END // 
DELIMITER ;

     
  
  
-- DESCRIBE tb_cartao_credito;
-- SELECT * FROM tb_cartao_credito;
  
  






-- Procedure DELETE tb_cartao_credito
-- DROP PROCEDURE sp_delete_cartao_credito
DELIMITER //
CREATE PROCEDURE sp_delete_perfil(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito= valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_cartao_credito
		WHERE id_cartao_credito = valor_id;
	END IF;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 19
-- Procedure INSERT tb_pagamento
-- DROP PROCEDURE sp_insert_pagamento;
DELIMITER //
CREATE PROCEDURE sp_insert_pagamento(valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
BEGIN
	IF
		(valor_p IS NULL ) OR (valor_p NOT BETWEEN 20.00 AND 100.00) THEN -- valor minimo e maximo que meu banco vai ceitar no momento
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
    ELSEIF
		(data_pagamento IS NULL) OR (data_pagamento > CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de pagamento invalida';
	ELSEIF NOT EXISTS
		(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito = id_do_cartao_credito) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSEIF NOT EXISTS
		(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
	ELSEIF NOT EXISTS
		(SELECT id_tipo_pagamento  FROM tb_tipo_pagamento  WHERE id_tipo_pagamento  = id_do_tipo_pagamento ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
	ELSE
		INSERT INTO tb__pagamento
		(valor, dt_pagamento, id_cartao_credito, id_cliente, id_tipo_pagamento, dt_atualizacao)
		VALUES
		(valor_p, data_pagamento, id_do_cartao_credito, id_do_cliente, id_do_tipo_pagamento, CURDATE());
    END IF;
END //
DELIMITER ;

-- DESCRIBE tb_pagamento;
-- SELECT * FROM tb_pagamento;







-- Procedure UPDATE tb_pagamento 
-- DROP PROCEDURE sp_update_pagamento;
DELIMITER //
CREATE PROCEDURE sp_update_pagamento(valor_id INT, valor_p FLOAT, data_pagamento DATETIME, id_do_cartao_credito INT, id_do_cliente INT, id_do_tipo_pagamento INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_pagamento FROM tb_pagamento WHERE id_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_pagamento invalido';
		ELSEIF
			(valor_p IS NULL ) OR (valor_p NOT BETWEEN 20.00 AND 100.00) THEN -- valor minimo e maximo que meu banco vai ceitar no momento
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(data_pagamento IS NULL) OR (data_pagamento > CURDATE()) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'data de pagamento invalida';
		ELSEIF NOT EXISTS
			(SELECT id_cartao FROM tb_cartao_credito WHERE id_cartao_credito = id_do_cartao_credito) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSEIF NOT EXISTS
			(SELECT id_cliente FROM tb_cliente WHERE id_cliente = id_do_cliente) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cliente invalido';
		ELSEIF NOT EXISTS
			(SELECT id_tipo_pagamento  FROM tb_tipo_pagamento  WHERE id_tipo_pagamento  = id_do_tipo_pagamento ) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_cartao_credito invalido';
		ELSE
			UPDATE tb_pagamento SET valor = valor_p , dt_pagamento = data_pagamento, id_cartao_credito = id_do_cartao_credito, 
				id_cliente = id_do_cliente, id_tipo_pagamento = id_do_tipo_pagamento, dt_atualizacao = CURDATE()
			WHERE id_pagamento = valor_id;
		END IF;
    END // 
DELIMITER ;



-- DESCRIBE tb_pagamento;
-- SELECT * FROM tb_pagamento;












-- Procedure DELETE tb_pagamento
-- DROP PROCEDURE sp_delete_pagamento
DELIMITER //
CREATE PROCEDURE sp_delete_pagamento(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pagamento FROM tb_pagamento WHERE id_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pagamento
		WHERE id_pagamento = valor_id;
	END IF;
END //
DELIMITER ;




-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 20
-- Procedure INSERT tb_catalogo_categoria
-- DROP PROCEDURE sp_catalogo_categoria;
DELIMITER //
CREATE PROCEDURE sp_insert_catalogo_categoria(id_do_catalogo INT, id_da_categoria INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_da_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_categoria invalido';
	ELSEIF EXISTS
		(SELECT id_categoria, id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = id_do_catalogo AND id_categoria = id_da_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
	ELSE
		INSERT INTO tb_catalogo_categoria
		(id_catalogo, id_categoria, dt_atualizacao)
		VALUES
		(id_do_catalogo, id_da_categoria, CURDATE());
    END IF;
END //
DELIMITER ;





-- Procedure UPDATE tb_catalogo_categoria
-- DROP PROCEDURE sp_update_catalogo_categoria;
DELIMITER //
CREATE PROCEDURE sp_update_catalogo_categoria(valor_id_catalogo INT, valor_id_categoria INT, id_do_catalogo INT, id_da_categoria INT)
	BEGIN
		IF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = valor_id_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_catalogo é inexistente em tb_catalogo_categoria';
		ELSEIF NOT EXISTS
			(SELECT id_categoria FROM tb_catalogo_categoria WHERE id_categoria = valor_id_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Antigo ID_categoria é inexistente em tb_catalogo_categoria';
		ELSEIF NOT EXISTS
			(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID_catalogo não existe na tabela de origem - tb_catalogo';
		ELSEIF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = id_da_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Novo ID__categoria não existe na tabela de origem - tb_categoria';
		ELSEIF EXISTS
			(SELECT id_categoria, id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = id_do_catalogo AND id_categoria = id_da_categoria) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Primary Key composta já existe com essa combinação de IDs';
		ELSE
			UPDATE tb_catalogo_categoria SET id_catalogo = id_do_catalogo, id_categoria = id_da_categoria, dt_atualizacao = CURDATE()
			WHERE id_catalogo = valor_id_catalogo AND id_categoria = valor_id_categoria;
		END IF;
    END // 
DELIMITER ;

-- SELECT * FROM tb_catalogo_categoria;







-- Procedure DELETE tb_catalogo_categoria
-- DROP PROCEDURE sp_delete_catalogo_categoria
DELIMITER //
CREATE PROCEDURE sp_delete_catalogo_categoria(valor_id_catalogo INT, valor_id_catalogo INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo_categoria WHERE id_catalogo = valor_id_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_categoria FROM tb_catalogo_categoria WHERE id_categoria = id_da_categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_categoria invalido';
	ELSE
		DELETE FROM tb_catalogo_categoria
		WHERE id_catalogo = valor_id_catalogo AND id_categoria = valor_id_categoria;
	END IF;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 21
-- Procedure INSERT tb_elenco
-- DROP PROCEDURE sp_insert_elenco;
DELIMITER //
CREATE PROCEDURE sp_insert_elenco(id_do_catalogo INT, id_do_ator INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_catalogo FROM tb_catalogo WHERE id_catalogo = id_do_catalogo) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_catalogo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = id_do_ator) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_ator invalido';
	ELSE
			INSERT INTO tb_elenco
			(id_catalogo, id_ator, dt_atualizacao)
			VALUES
			(id_do_catalogo, id_do_ator, CURDATE());
		END IF;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 22
-- Procedure INSERT tb_serie 
-- DROP PROCEDURE sp_insert_serie ;
DELIMITER //
CREATE PROCEDURE sp_insert_serie(v_titulo VARCHAR(45), qtd_de_temporadas TINYINT, qtd_do_episodios TINYINT, id_do_catalogo INT)
BEGIN
	IF
		(v_titulo IS NULL ) OR (fn_valida_texto(v_titulo, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		qtd_de_temporadas NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 TEMPORADA para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de temporadas invalido';
	ELSEIF
		qtd_do_episodios NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
	ELSE
			INSERT INTO tb_serie
			(titulo, qtd_temporadas, qtd_episodios, id_catalogo, dt_atualizacao)
			VALUES
			(LOWER(v_titulo), qtd_de_temporadas, qtd_do_episodios, id_do_catalogo, CURDATE());
	END IF;
END //
DELIMITER ;

-- DESCRIBE tb_serie;
-- SELECT * FROM tb_serie;














-- Procedure DELETE tb_serie
-- DROP PROCEDURE sp_delete_serie
DELIMITER //
CREATE PROCEDURE sp_delete_serie(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_serie
		WHERE id_serie = valor_id;
	END IF;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 23
-- Procedure INSERT tb_temporada 
-- DROP PROCEDURE sp_insert_temporada ;
DELIMITER //
CREATE PROCEDURE sp_insert_temporada(v_titulo VARCHAR(45), id_da_serie INT, v_descricao VARCHAR(255), qtd_de_episodio TINYINT)
BEGIN
	IF
		(v_titulo IS NULL ) OR (fn_valida_texto(v_titulo, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'titulo invalido';
	ELSEIF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = id_da_serie) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_serie invalido';
	ELSEIF
		(v_descricao IS NULL ) OR (fn_valida_texto(v_descricao, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalido';
	ELSEIF
		qtd_do_episodios NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
    ELSE
		INSERT INTO tb_temporada
		(titulo, id_serie, descricao, qtd_episodio, dt_atualizacao)
		VALUES
		(LOWER(v_titulo), id_da_serie, LOWER(v_descricao), qtd_de_episodio, CURDATE());
	END IF;
END //
DELIMITER ;


-- DESCRIBE tb_temporada;
-- SELECT * FROM tb_temporada;



-- Procedure DELETE tb_temporada
-- DROP PROCEDURE sp_delete_temporada
DELIMITER //
CREATE PROCEDURE sp_delete_temporada(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_temporada FROM tb_temporada WHERE id_temporada = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_temporada
		WHERE id_temporada = valor_id;
	END IF;
END //
DELIMITER ;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 24
-- Procedure INSERT tb_episodio
-- DROP PROCEDURE sp_insert_episodio ;
DELIMITER //
CREATE PROCEDURE sp_insert_episodio(v_nome VARCHAR(45), n_numero TINYINT, id_da_temporada INT, id_da_serie INT)
BEGIN
	IF
		(v_nome IS NULL ) OR (fn_valida_texto(v_nome, 0)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		n_numero NOT BETWEEN 1 AND 50 THEN                                         -- A pricipio uma serie PRECISA de 1 episodio para ser cadastrada
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'Numero de episodios invalido';
	ELSEIF NOT EXISTS
		(SELECT id__temporada FROM tb_temporada WHERE id_temporada = id_da_temporada) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_temporada invalida';
	ELSEIF NOT EXISTS
		(SELECT id_serie FROM tb_serie WHERE id_serie = id_da_serie) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID_serie invalido';
    ELSE
		INSERT INTO tb_episodio
		(nome, numero, id_temporada, id_serie, dt_atualizacao)
		VALUES
		(LOWER(v_nome), n_numero, id_da_temporada, id_da_serie, CURDATE());
	END IF;
END //
DELIMITER ;

-- DESCRIBE tb_episodio;
-- SELECT * FROM _episodio;


-- Procedure DELETE tb_episodio
-- DROP PROCEDURE sp_delete_episodio
DELIMITER //
CREATE PROCEDURE sp_delete_episodio(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_episodio FROM tb_episodio WHERE id_episodio = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM tb_episodio
		WHERE id_episodio = valor_id;
	END IF;
END //
DELIMITER ;





