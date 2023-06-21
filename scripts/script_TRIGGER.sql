
-- DROP TRIGGER tr_insert_episodio_temporada;
DELIMITER //
CREATE TRIGGER tr_insert_episodio_temporada
AFTER INSERT 
ON tb_episodio
FOR EACH ROW
BEGIN
		UPDATE tb_temporada SET qtd_episodio = qtd_episodio + 1
		WHERE id_temporada = NEW.id_temporada;
END //
DELIMITER ;


-- DROP TRIGGER tr_insert_episodio_serie;
DELIMITER //
CREATE TRIGGER tr_insert_episodio_serie
AFTER INSERT 
ON tb_episodio
FOR EACH ROW
BEGIN
		UPDATE tb_serie SET qtd_episodios = qtd_episodios + 1
		WHERE id_serie = NEW.id_serie;
END //
DELIMITER ;


-- DROP TRIGGER tr_insert_temporada_serie;
DELIMITER //
CREATE TRIGGER tr_insert_temporada_serie
AFTER INSERT 
ON tb_temporada
FOR EACH ROW
BEGIN
		UPDATE tb_serie SET qtd_temporadas = qtd_temporadas + 1
		WHERE id_serie = NEW.id_serie;
END //
DELIMITER ;





-- DROP TRIGGER tr_
