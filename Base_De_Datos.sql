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
-- ALTER TABLE `SAGAS` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Peliculas_Saga` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
-- INSERT INTO `SAGAS` (`ID_Saga`,`Nombre_Saga`) VALUES
-- ('','');
-- INSERT INTO `Peliculas_Saga` (`ID_Pelicula`,`ID_Saga`) VALUES
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
('1', 'Ingles'),
('2', 'Español'),
('3', 'Italiano'),
('4', 'Aleman'),
('5', 'Franses'),
('6', 'Japones');

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

-- Tabla Peliculas
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

-- Tabla Personas
INSERT INTO `PERSONAS` (`ID_Persona`, `Nombre_Persona`, `Edad`) VALUES
('1', 'James Cameron', '68'),
('2', 'Kate Winslet', '47'),
('3', 'Leonardo DiCaprio', '48'),
('4', 'Frances Fisher', '71'),
('5', 'Billy Zane', '57'),
('6', 'George Lucas', '79'),
('7', 'Mark Hamill', '71'),
('8', 'Carrie Fisher', '60'),
('9', 'Harrison Ford', '80'),
('10', 'Alec Guinness', '86'),
('11', 'Hayao Miyazaki', '82'),
('12', 'Rumi Hiragi', '99'),
('13', 'Miyu Irino', '99'),
('14', 'Mari Natsuki', '99'),
('15', 'Takashi Naito', '99'),
('16', 'Pete Docter', '54'),
('17', 'Amy Poehler', '51'),
('18', 'Phyllis Smith', '71'),
('19', 'Richard King', '66'),
('20', 'Bill Hader', '45'),
('21', 'Mel Gibson', '67'),
('22', 'Catherine McCormack', '51'),
('23', 'Sophie Marceau', '56'),
('24', 'Patrick McGoohan', '80'),
('25', 'Robert Zemeckis', '71'),
('26', 'Michael J. Fox', '62'),
('27', 'Christopher Lloyd', '84'),
('28', 'Lea Thompson', '62'),
('29', 'Crispin Glover', '59'),
('30', 'Tom Hanks', '66'),
('31', 'Robin Wright', '57'),
('32', 'Gary Sinise', '68'),
('33', 'Sally Field', '76'),
('34', 'Bob Hoskins', '71'),
('35', 'Joanna Cassaidy', '77'),
('36', 'Charles Fleischer', '72'),
('37', 'Steven Spielberg', '76'),
('38', 'Sean Connery', '90'),
('39', 'Alison Doody', '56'),
('40', 'Julian Glover', '88'),
('41', 'Joe Johnston', '73'),
('42', 'Robin Williams', '63'),
('43', 'Kristen Dunst', '41'),
('44', 'Bradley Pierce', '40'),
('45', 'Bonnie Hunt', '61');

-- Tabla Sagas
INSERT INTO `SAGAS` (`ID_Saga`,`Nombre_Saga`) VALUES
('1','Star Wars'),
('2', 'Back to the Future'),
('3', 'Indiana Jones'),
('4', 'Jumanji');

-- Tabla PELICULAS_GENEROS
INSERT INTO `PELICULAS_GENEROS` (`ID_Pelicula`,`ID_Genero`) VALUES
('597','4'),
('597','10'),
('597','18'),
('11','1'),
('11','7'),
('11','8'),
('129','1'),
('129','11'),
('129','18'),
('59170','3'),
('59170','6'),
('59170','10'),
('59170','17'),
('197','1'),
('197','4'),
('197','18'),
('105','1'),
('105','7'),
('105','8'),
('13','1'),
('13','4'),
('13','10'),
('856','1'),
('856','3'),
('856','7'),
('856','8'),
('89','1'),
('89','7'),
('89','8'),
('89','18'),
('8844','1'),
('8844','3'),
('8844','7'),
('8844','8');

-- Tabla Lengua_PELICULAS_IDIOMAS
INSERT INTO `Lengua_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idioma`) VALUES
('597','1'),
('11','1'),
('129','6'),
('59170','1'),
('197','1'),
('105','1'),
('13','1'),
('856','1'),
('89','1'),
('8844','1');

-- Tabla Subtitulos_PELICULAS_IDIOMAS
INSERT INTO `Subtitulos_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idioma`) VALUES
('597','1'),
('11','1'),
('129','1'),
('59170','1'),
('197','1'),
('105','1'),
('13','1'),
('856','1'),
('89','1'),
('8844','1'),
('597','2'),
('11','2'),
('129','2'),
('59170','2'),
('197','2'),
('105','2'),
('13','2'),
('856','2'),
('89','2'),
('8844','2'),
('597','3'),
('11','3'),
('129','3'),
('59170','3'),
('197','3'),
('105','3'),
('13','3'),
('856','3'),
('89','3'),
('8844','3'),
('597','4'),
('11','4'),
('129','4'),
('59170','4'),
('197','4'),
('105','4'),
('13','4'),
('856','4'),
('89','4'),
('8844','4'),
('597','5'),
('11','5'),
('129','5'),
('59170','5'),
('197','5'),
('105','5'),
('13','5'),
('856','5'),
('89','5'),
('8844','5'),
('597','6'),
('11','6'),
('129','6'),
('59170','6'),
('197','6'),
('105','6'),
('13','6'),
('856','6'),
('89','6'),
('8844','6');

-- Tabla Titulos_PELICULAS_IDIOMAS
INSERT INTO `Titulos_PELICULAS_IDIOMAS` (`ID_Pelicula`,`ID_Idiomas`,`Nombre_Original`,`Nombre_en_este_idioma`) VALUES
('597','2','Titanic','Titanic'),
('11','2','Star Wars: Episode IV - A New Hope','La guerra de las galaxias: Episodio IV - Una nueva esperanza'),
('129','2','Spirited Away','El viaje de Chihiro'),
('59170','2','Inside Out','Intensa-Mente'),
('197','2','Braveheart','Corazón valiente'),
('105','2','Back to the Future','Volver al futuro'),
('13','2','Forrest Gump','Forrest Gump'),
('856','2','Who Framed Roger Rabbit?','¿Quién engañó a Roger Rabbit?'),
('89','2','Indiana Jones and the Last Crusade','Indiana Jones y la última cruzada'),
('8844','2','Jumanji','Jumanji');

-- Tabla Gano_PELICULAS_PREMIOS
INSERT INTO `Gano_PELICULAS_PREMIOS` (`ID_Pelicula`,`ID_Premio`) VALUES
('597','1'),
('197','1'),
('13','1');

-- Tabla Habla_PERSONAS_IDIOMAS
INSERT INTO `Habla_PERSONAS_IDIOMAS` (`ID_Persona`,`ID_Idioma`) VALUES
('1', '1'),
('2', '1'),
('3', '1'),
('4', '1'),
('5', '1'),
('6', '1'),
('7', '1'),
('8', '1'),
('9', '1'),
('10', '1'),
('11', '6'),
('12', '6'),
('13', '6'),
('14', '6'),
('15', '6'),
('16', '1'),
('17', '1'),
('18', '1'),
('19', '1'),
('20', '1'),
('21', '1'),
('22', '1'),
('23', '1'),
('24', '1'),
('25', '1'),
('26', '1'),
('27', '1'),
('28', '1'),
('29', '1'),
('30', '1'),
('31', '1'),
('32', '1'),
('33', '1'),
('34', '1'),
('35', '1'),
('36', '1'),
('37', '1'),
('38', '1'),
('39', '1'),
('40', '1'),
('41', '1'),
('42', '1'),
('43', '1'),
('44', '1'),
('45', '1');

-- Tabla Gano_PERSONA_PREMIO
INSERT INTO `Gano_PERSONA_PREMIO` (`ID_Premio`,`ID_Persona`) VALUES
('1', '2'),
('2', '5'),
('3', '3'),
('10', '3'),
('21', '2'),
('25', '2'),
('30', '3'),
('33', '5'),
('37', '2'),
('38', '4'),
('42', '4');

-- Tabla Participacion_PELICULAS_PERSONAS
INSERT INTO `Participacion_PELICULAS_PERSONAS` (`ID_Persona`,`ID_Pelicula`,`ID_Rol`) VALUES
('1', '597', '1'),
('2', '597', '2'),
('3', '597', '2'),
('4', '597', '3'),
('5', '597', '3'),
('6', '11', '1'),
('7', '11', '2'),
('8', '11', '2'),
('9', '11', '3'),
('10', '11', '3'),
('11', '129', '1'),
('12', '129', '4'),
('13', '129', '4'),
('14', '129', '4'),
('15', '129', '4'),
('16', '59170', '1'),
('17', '59170', '4'),
('18', '59170', '4'),
('19', '59170', '4'),
('20', '59170', '4'),
('21', '197', '1'),
('21', '197', '2'),
('22', '197', '3'),
('23', '197', '2'),
('24', '197', '3'),
('25', '105', '1'),
('26', '105', '2'),
('27', '105', '3'),
('28', '105', '3'),
('29', '105', '3'),
('25', '13', '1' ),
('30', '13', '2'),
('31', '13', '3'),
('32', '13', '3'),
('33', '13', '3'),
('25', '856', '1'),
('34', '856', '2'),
('27', '856', '3'),
('35', '856', '3'),
('36', '856', '4'),
('37', '89', '1'),
('9', '89', '2'),
('38', '89', '3'),
('39', '89', '3'),
('40', '89', '3'),
('41', '8844', '1'),
('42', '8844', '2'),
('43', '8844', '2'),
('44', '8844', '3'),
('45', '8844', '3');

-- Tabla Peliculas_Saga
INSERT INTO `Peliculas_Saga` (`ID_Pelicula`,`ID_Saga`,`Orden_En_Saga`) VALUES
('11', '1', '4'),
('105', '2', '1'),
('89', '3', '3'),
('8844', '4', '1');
