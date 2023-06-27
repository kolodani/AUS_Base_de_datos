-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'GENEROS'
-- 
-- ---

DROP TABLE IF EXISTS `GENEROS`;
		
CREATE TABLE `GENEROS` (
  `ID_Genero` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Genero` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Genero`)
);

-- ---
-- Table 'PELICULAS'
-- 
-- ---

DROP TABLE IF EXISTS `PELICULAS`;
		
CREATE TABLE `PELICULAS` (
  `ID_Pelicula` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Pelicula` VARCHAR(100) NULL,
  `Orden_Saga` INTEGER NOT NULL,
  `Duracion` INTEGER NOT NULL,
  `Año_de_estreno` YEAR NOT NULL,
  PRIMARY KEY (`ID_Pelicula`)
);

-- ---
-- Table 'IDIOMAS'
-- 
-- ---

DROP TABLE IF EXISTS `IDIOMAS`;
		
CREATE TABLE `IDIOMAS` (
  `ID_Idioma` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Idioma` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Idioma`)
);

-- ---
-- Table 'PREMIO'
-- 
-- ---

DROP TABLE IF EXISTS `PREMIOS`;
		
CREATE TABLE `PREMIOS` (
  `ID_Premio` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Premio` VARCHAR(100) NOT NULL,
  `Categoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Premio`)
);

-- ---
-- Table 'PERSONAS'
-- 
-- ---

DROP TABLE IF EXISTS `PERSONAS`;
		
CREATE TABLE `PERSONAS` (
  `ID_Persona` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Persona` VARCHAR(100) NOT NULL,
  `Edad` INTEGER(200) NOT NULL,
  PRIMARY KEY (`ID_Persona`)
);

-- ---
-- Table 'PELICULAS_GENEROS'
-- 
-- ---

DROP TABLE IF EXISTS `PELICULAS_GENEROS`;
		
CREATE TABLE `PELICULAS_GENEROS` (
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Genero` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Pelicula`, `ID_Genero`)
);

-- ---
-- Table 'Lengua_PELICULAS_IDIOMAS'
-- 
-- ---

DROP TABLE IF EXISTS `Lengua_PELICULAS_IDIOMAS`;
		
CREATE TABLE `Lengua_PELICULAS_IDIOMAS` (
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Idioma` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Pelicula`, `ID_Idioma`)
);

-- ---
-- Table 'Subtitulos_PELICULAS_IDIOMAS'
-- 
-- ---

DROP TABLE IF EXISTS `Subtitulos_PELICULAS_IDIOMAS`;
		
CREATE TABLE `Subtitulos_PELICULAS_IDIOMAS` (
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Idioma` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Pelicula`, `ID_Idioma`)
);

-- ---
-- Table 'Titulos_PELICULAS_IDIOMAS'
-- 
-- ---

DROP TABLE IF EXISTS `Titulos_PELICULAS_IDIOMAS`;
		
CREATE TABLE `Titulos_PELICULAS_IDIOMAS` (
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Idiomas` INTEGER NOT NULL,
  `Nombre_Original` CHAR(100) NOT NULL,
  `Nombre_en_este_idioma` CHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Pelicula`, `ID_Idiomas`)
);

-- ---
-- Table 'Gano_PELICULAS_PREMIOS'
-- 
-- ---

DROP TABLE IF EXISTS `Gano_PELICULAS_PREMIOS`;
		
CREATE TABLE `Gano_PELICULAS_PREMIOS` (
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Premio` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Pelicula`, `ID_Premio`)
);

-- ---
-- Table 'Habla_PERSONAS_IDIOMAS'
-- 
-- ---

DROP TABLE IF EXISTS `Habla_PERSONAS_IDIOMAS`;
		
CREATE TABLE `Habla_PERSONAS_IDIOMAS` (
  `ID_Persona` INTEGER NOT NULL,
  `ID_Idioma` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Persona`, `ID_Idioma`)
);

-- ---
-- Table 'Gano_PERSONA_PREMIO'
-- 
-- ---

DROP TABLE IF EXISTS `Gano_PERSONA_PREMIO`;
		
CREATE TABLE `Gano_PERSONA_PREMIO` (
  `ID_Premio` INTEGER NOT NULL,
  `ID_Persona` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Persona`, `ID_Premio`)
);

-- ---
-- Table 'Participacion_PELICULAS_PERSONAS'
-- 
-- ---

DROP TABLE IF EXISTS `Participacion_PELICULAS_PERSONAS`;
		
CREATE TABLE `Participacion_PELICULAS_PERSONAS` (
  `ID_Persona` INTEGER NOT NULL,
  `ID_Pelicula` INTEGER NOT NULL,
  `ID_Rol` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Persona`, `ID_Pelicula`, `ID_Rol`)
);

-- ---
-- Table 'ROLES'
-- 
-- ---

DROP TABLE IF EXISTS `ROLES`;
		
CREATE TABLE `ROLES` (
  `ID_Rol` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Rol`)
);

-- ---
-- Table 'SAGAS'
-- 
-- ---

DROP TABLE IF EXISTS `SAGAS`;
		
CREATE TABLE `SAGAS` (
  `ID_Saga` INTEGER NOT NULL AUTO_INCREMENT,
  `Nombre_Saga` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Saga`)
);

-- ---
-- Table 'Peliculas_Saga'
-- 
-- ---

DROP TABLE IF EXISTS `Peliculas_Saga`;
		
CREATE TABLE `Peliculas_Saga` (
  `ID_Saga` INTEGER NULL,
  `ID_Pelicula` INTEGER NOT NULL,
  `Orden_En_Saga` INTEGER NOT NULL,
  PRIMARY KEY (`ID_Saga`, `ID_Pelicula`)
);

-- ---
-- Foreign Keys 
-- ---
ALTER TABLE PELICULAS_GENEROS ADD CONSTRAINT da_lo_mismo FOREIGN KEY (ID_Genero) REFERENCES GENEROS(ID_Genero);
ALTER TABLE PELICULAS_GENEROS ADD CONSTRAINT da_lo_mismo2 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Lengua_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo3 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Lengua_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo4 FOREIGN KEY (ID_Idioma) REFERENCES IDIOMAS(ID_Idioma);
ALTER TABLE Subtitulos_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo5 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Subtitulos_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo6 FOREIGN KEY (ID_Idioma) REFERENCES IDIOMAS(ID_Idioma);
ALTER TABLE Titulos_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo7 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Titulos_PELICULAS_IDIOMAS ADD CONSTRAINT da_lo_mismo8 FOREIGN KEY (ID_Idiomas) REFERENCES IDIOMAS(ID_Idioma);
ALTER TABLE Gano_PELICULAS_PREMIOS ADD CONSTRAINT da_lo_mismo9 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Gano_PELICULAS_PREMIOS ADD CONSTRAINT da_lo_mismo10 FOREIGN KEY (ID_Premio) REFERENCES PREMIOS(ID_Premio);
ALTER TABLE Habla_PERSONAS_IDIOMAS ADD CONSTRAINT da_lo_mismo11 FOREIGN KEY (ID_Persona) REFERENCES PERSONAS(ID_Persona);
ALTER TABLE Habla_PERSONAS_IDIOMAS ADD CONSTRAINT da_lo_mismo12 FOREIGN KEY (ID_Idioma) REFERENCES IDIOMAS(ID_Idioma);
ALTER TABLE Gano_PERSONA_PREMIO ADD CONSTRAINT da_lo_mismo13 FOREIGN KEY (ID_Premio) REFERENCES PREMIOS(ID_Premio);
ALTER TABLE Gano_PERSONA_PREMIO ADD CONSTRAINT da_lo_mismo14 FOREIGN KEY (ID_Persona) REFERENCES PERSONAS(ID_Persona);
ALTER TABLE Participacion_PELICULAS_PERSONAS ADD CONSTRAINT da_lo_mismo15 FOREIGN KEY (ID_Persona) REFERENCES PERSONAS(ID_Persona);
ALTER TABLE Participacion_PELICULAS_PERSONAS ADD CONSTRAINT da_lo_mismo16 FOREIGN KEY (ID_Pelicula) REFERENCES PELICULAS(ID_Pelicula);
ALTER TABLE Participacion_PELICULAS_PERSONAS ADD CONSTRAINT da_lo_mismo17 FOREIGN KEY (ID_Rol) REFERENCES ROLES(ID_Rol);
ALTER TABLE Peliculas_Saga ADD CONSTRAINT da_lo_mismo18 FOREIGN KEY (ID_Saga) REFERENCES SAGAS(ID_Saga);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `GENEROS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PELICULAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `IDIOMAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PREMIO` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PERSONAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `PELICULAS_GENEROS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Lengua_PELICULAS_IDIOMAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Subtitulos_PELICULAS_IDIOMAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Titulos_PELICULAS_IDIOMAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Gano_PELICULAS_PREMIOS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Habla_PERSONAS_IDIOMAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Gano_PERSONA_PREMIO` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Participacion_PELICULAS_PERSONAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ROLES` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `GENEROS` (`ID_Genero`,`Nombre_Genero`) VALUES
-- ('','');
-- INSERT INTO `PELICULAS` (`ID_Pelicula`,`Nombre_Pelicula`,`Orden_Saga`,`Duracion`,`Año_de_estreno`) VALUES
-- ('','','','','');
-- INSERT INTO `IDIOMAS` (`ID_Idioma`,`Nombre_Idioma`) VALUES
-- ('','');
-- INSERT INTO `PREMIO` (`ID_Premio`,`Nombre_Premio`,`Categoria`) VALUES
-- ('','','');
-- INSERT INTO `PERSONAS` (`ID_Persona`,`Nombre_Persona`,`Edad`) VALUES
-- ('','','');
-- INSERT INTO `PELICULAS_GENEROS` (`ID_Pelicula`,`ID_Genero`) VALUES
-- ('','');
-- INSERT INTO `Lengua_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idioma`) VALUES
-- ('','');
-- INSERT INTO `Subtitulos_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idioma`) VALUES
-- ('','');
-- INSERT INTO `Titulos_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idiomas`,`Nombre_Original`,`Nombre_en_este_idioma`) VALUES
-- ('','','','');
-- INSERT INTO `Gano_PELICULAS_PREMIOS` (`ID_Pelicula`,`ID_Premio`) VALUES
-- ('','');
-- INSERT INTO `Habla_PERSONAS_IDIOMAS` (`ID_Persona`,`ID_Idioma`) VALUES
-- ('','');
-- INSERT INTO `Gano_PERSONA_PREMIO` (`ID_Premio`,`ID_Persona`) VALUES
-- ('','');
-- INSERT INTO `Participacion_PELICULAS_PERSONAS` (`ID_Persona`,`ID_Pelicula`,`ID_Rol`) VALUES
-- ('','','');
-- INSERT INTO `ROLES` (`ID_Rol`,`Nombre_Rol`) VALUES
-- ('','');



-- ---
-- agregar datos
-- ---

-- Tabla Generos de peliculas
INSERT INTO `GENEROS` (`ID_Genero`,`Nombre_Genero`) VALUES
('1','Accion'),
('2','Aventura'),
('3','Comedia'),
('4','Drama'),
('5','Terror'),
('6','Musical'),
('7','Ciencia Ficcion'),
('8','Fantasia'),
('9','Suspenso'),
('10','Romance'),
('11','Animacion'),
('12','Documental'),
('13','Crimen'),
('14','Guerra'),
('15','Misterio'),
('16','Biografia'),
('17','Familia'),
('18','Historia'),
('19','Western'),
('20','Deporte'),
('21','Musical'),
('22','Thriller'),
('23','Infantil');

-- Tabla Idiomas
INSERT INTO `IDIOMAS` (`ID_Idioma`,`Nombre_Idioma`) VALUES
('1', 'Español'),
('2', 'Ingles'),
('3', 'Italiano'),
('4', 'Aleman'),
('5', 'Franses');

-- Tabla Premios
INSERT INTO `PREMIOS` (`ID_Premio`, `Nombre_Premio`, `Categoria`) VALUES
('1', 'Oscar', 'Mejor Pelicula'),
('2', 'Oscar', 'Mejor Director'),
('3', 'Oscar', 'Mejor Actor Protagonico'),
('4', 'Oscar', 'Mejor Actor De Reparto'),
('5', 'Oscar', 'Mejor Actriz Protagonico'),
('6', 'Oscar', 'Mejor Actriz De Reparto');

-- Tabla Roles
INSERT INTO `ROLES` (`ID_Rol`,`Nombre_Rol`) VALUES
('1', 'Director'),
('2', 'Actor/Actriz Protagonico'),
('3', 'Actor/Actriz De Reparto'),
('4', 'Voz');

-- Tabla Personas
INSERT INTO `PELICULAS` (`ID_Pelicula`, `Nombre_Pelicula`, `Duracion`, `Año_de_estreno`) VALUES
('597', 'Titanic', 194, '1997'),
('11', 'Star Wars: Episode IV - A New Hope', 121, '1977'),
('129', 'Spirited Away', 125, '2001'),
('59170', 'Inside Out', 102, '2015'),
('197', 'Braveheart', 177, '1995'),
('105', 'Back to the Future', 111, '1985'),
('13', 'Forrest Gump', 142, '1994'),
('856', 'Who Framed Roger Rabbit', 103, '1988'),
('89', 'Indiana Jones and the Last Crusade', 127, '1989'),
('8844', 'Jumanji', 101, '1995');

