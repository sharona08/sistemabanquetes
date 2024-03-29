SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `banquetes` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EMPRESA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EMPRESA` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`EMPRESA` (
  `rif` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `direccion` VARCHAR(45) NULL ,
  PRIMARY KEY (`rif`) )
ENGINE = InnoDB;

USE `banquetes` ;

-- -----------------------------------------------------
-- Table `banquetes`.`EMPRESA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`EMPRESA` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`EMPRESA` (
  `rif` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(100) NOT NULL ,
  `telefono` VARCHAR(45) NULL ,
  `direccion` VARCHAR(5000) NULL ,
  `habilitado` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`rif`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`TIPO_EVENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`TIPO_EVENTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`TIPO_EVENTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `tipoEvento` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `tipoEvento_UNIQUE` (`tipoEvento` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`CONTACTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`CONTACTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`CONTACTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `telefono` VARCHAR(45) NULL ,
  `direccion` VARCHAR(5000) NULL ,
  `habilitado` TINYINT(1)  NOT NULL ,
  `rifEmpresa` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_CONTACTO_EMPRESA1` (`rifEmpresa` ASC) ,
  CONSTRAINT `fk_CONTACTO_EMPRESA1`
    FOREIGN KEY (`rifEmpresa` )
    REFERENCES `banquetes`.`EMPRESA` (`rif` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`EVENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`EVENTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`EVENTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `estado` VARCHAR(1) NOT NULL ,
  `nombre` VARCHAR(100) NOT NULL ,
  `fechaInicio` DATE NOT NULL ,
  `fechaFin` DATE NOT NULL ,
  `cantidadPersonas` INT(11)  NOT NULL ,
  `horaInicio` TIME NOT NULL ,
  `horaFin` TIME NOT NULL ,
  `idTipoEvento` INT(11)  NOT NULL ,
  `rifEmpresa` VARCHAR(45) NOT NULL ,
  `idContacto` INT(11)  NOT NULL ,
  `nota` VARCHAR(5000) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_EVENTO_EMPRESA1` (`rifEmpresa` ASC) ,
  INDEX `fk_EVENTO_TIPO_EVENTO1` (`idTipoEvento` ASC) ,
  INDEX `fk_EVENTO_CONTACTO1` (`idContacto` ASC) ,
  CONSTRAINT `fk_EVENTO_EMPRESA1`
    FOREIGN KEY (`rifEmpresa` )
    REFERENCES `banquetes`.`EMPRESA` (`rif` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_TIPO_EVENTO1`
    FOREIGN KEY (`idTipoEvento` )
    REFERENCES `banquetes`.`TIPO_EVENTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_CONTACTO1`
    FOREIGN KEY (`idContacto` )
    REFERENCES `banquetes`.`CONTACTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`SALON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`SALON` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`SALON` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `habilitado` TINYINT(1)  NOT NULL ,
  `idSalon` INT(11)  NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ,
  INDEX `fk_SALON_SALON1` (`idSalon` ASC) ,
  CONSTRAINT `fk_SALON_SALON1`
    FOREIGN KEY (`idSalon` )
    REFERENCES `banquetes`.`SALON` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`MONTAJE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`MONTAJE` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`MONTAJE` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `tipoMontaje` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `tipoMontaje_UNIQUE` (`tipoMontaje` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`EVENTO_SALA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`EVENTO_SALA` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`EVENTO_SALA` (
  `idEvento` INT(11)  NOT NULL ,
  `nuevoCosto` DOUBLE NULL DEFAULT NULL ,
  `idSalon` INT(11)  NOT NULL ,
  `idMontaje` INT(11)  NOT NULL ,
  `visible` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`idEvento`, `idSalon`) ,
  INDEX `fk_EVENTO_SALA_EVENTO1` (`idEvento` ASC) ,
  INDEX `fk_EVENTO_SALA_SALON1` (`idSalon` ASC) ,
  INDEX `fk_EVENTO_SALA_MONTAJE1` (`idMontaje` ASC) ,
  CONSTRAINT `fk_EVENTO_SALA_EVENTO1`
    FOREIGN KEY (`idEvento` )
    REFERENCES `banquetes`.`EVENTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_SALA_SALON1`
    FOREIGN KEY (`idSalon` )
    REFERENCES `banquetes`.`SALON` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_SALA_MONTAJE1`
    FOREIGN KEY (`idMontaje` )
    REFERENCES `banquetes`.`MONTAJE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'DETALLE_SALA_idMontaje';


-- -----------------------------------------------------
-- Table `banquetes`.`DEPARTAMENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`DEPARTAMENTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`DEPARTAMENTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`SERVICIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`SERVICIO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`SERVICIO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `descripcion` VARCHAR(5000) NULL ,
  `costoUnitario` DOUBLE NOT NULL ,
  `tipoServicio` VARCHAR(200) NOT NULL ,
  `habilitado` TINYINT(1)  NOT NULL ,
  `idDepartamento` INT(11)  NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_SERVICIO_DEPARTAMENTO1` (`idDepartamento` ASC) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ,
  CONSTRAINT `fk_SERVICIO_DEPARTAMENTO1`
    FOREIGN KEY (`idDepartamento` )
    REFERENCES `banquetes`.`DEPARTAMENTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`SERVICIO_EVENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`SERVICIO_EVENTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`SERVICIO_EVENTO` (
  `idServicio` INT(11)  NOT NULL ,
  `idEvento` INT(11)  NOT NULL ,
  `idSalon` INT(11)  NOT NULL ,
  `cantidad` INT(11)  NOT NULL ,
  `horaInicio` TIME NOT NULL ,
  `horaFin` TIME NULL DEFAULT NULL ,
  `notaEspecial` VARCHAR(5000) NULL DEFAULT NULL ,
  `nuevoCosto` DOUBLE NULL ,
  `nuevoNombre` VARCHAR(100) NULL ,
  `nuevaDescripcion` VARCHAR(5000) NULL ,
  `fechaInicio` DATE NOT NULL ,
  `fechaFin` DATE NOT NULL ,
  PRIMARY KEY (`idServicio`, `idEvento`, `idSalon`, `fechaInicio`) ,
  INDEX `fk_SERVICIO_has_EVENTO_SERVICIO1` (`idServicio` ASC) ,
  INDEX `fk_SERVICIO_EVENTO_EVENTO_SALA1` (`idEvento` ASC, `idSalon` ASC) ,
  CONSTRAINT `fk_SERVICIO_has_EVENTO_SERVICIO1`
    FOREIGN KEY (`idServicio` )
    REFERENCES `banquetes`.`SERVICIO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SERVICIO_EVENTO_EVENTO_SALA1`
    FOREIGN KEY (`idEvento` , `idSalon` )
    REFERENCES `banquetes`.`EVENTO_SALA` (`idEvento` , `idSalon` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`ROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`ROL` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`ROL` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `tipoRol` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `tipoRol_UNIQUE` (`tipoRol` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`USUARIO` (
  `username` VARCHAR(50) NOT NULL ,
  `password` VARCHAR(200) NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido` VARCHAR(45) NOT NULL ,
  `correo` VARCHAR(45) NOT NULL ,
  `idRol` INT(11)  NOT NULL ,
  PRIMARY KEY (`username`) ,
  INDEX `fk_USUARIO_ROL1` (`idRol` ASC) ,
  CONSTRAINT `fk_USUARIO_ROL1`
    FOREIGN KEY (`idRol` )
    REFERENCES `banquetes`.`ROL` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`IVA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`IVA` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`IVA` (
  `id` INT(11)  NOT NULL ,
  `porcentaje` DOUBLE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EMPRESA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00000000-0', 'PARTICULAR', NULL, NULL, true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00120707-4', 'MOTOROLA DE VENEZUELA', NULL, 'AV. FRANCISCO DE MIRANDA, CENTRO LIDO, TORRE A, PISO 15, EL ROSAL. CARACAS', true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00000001-0', 'LABORATORIOS ABBOTT', NULL, 'CENTRO GERENCIAL LOS CORTIJOS PISO 1 CALLE LOS LABORATORIOS. CARACAS', true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00002735-8', 'AVON COSMETICS DE VENEZUELA', NULL, 'AV PPAL DE LOS RUICES CENTRO MONACA. P.B. LOCAL C. ANACO', true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00021492-1', 'GLAXOSMITHKLINE VENEZUELA, C.A.', NULL, 'CALLE LUIS DE CAMOENS, #115-117, URB. LA TRINIDAD. CARACAS', true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-30131018-7', 'KRAFT FOODS VENEZUELA, C.A.', NULL, 'AV. FRANCISCO DE MIRANDA, URB. CAMPO ALEGRE, EDIF. SEGUROS VENEZUELA PI. CARACAS', true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00119573-4', 'CORPORACION CLOROX DE VENEZUELA, S.A.', NULL, 'AV. GUAICAIPURO EDIF. FORUM PISO 13, EL ROSAL.', true);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`TIPO_EVENTO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (1, 'REUNION');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (2, 'CURSO');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (3, 'PRESENTACION');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (4, 'CONFERENCIA');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (5, 'TALLER');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (6, 'BODA');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (7, 'DESAYUNO');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (8, 'ALMUERZO');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (9, 'CENA');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (10, 'EVENTOS ESPECIALES');
INSERT INTO `banquetes`.`TIPO_EVENTO` (`id`, `tipoEvento`) VALUES (11, 'EXPOSICION');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`CONTACTO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (1, 'KAREN GOSLING', NULL, NULL, true, 'J-00120707-4');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (2, 'IRLENE SEQUEA', '7007107', NULL, true, 'J-00000001-0');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (3, 'ANA URBINA', '3401620', NULL, true, 'J-00002735-8');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (4, 'ARBORY LEON', '9452122', NULL, true, 'J-00021492-1');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (5, 'CAMILA HOMBERGER', '6009248', NULL, true, 'J-30131018-7');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (6, 'IOLANDA CASTRIOTTA', '9050808', NULL, true, 'J-00119573-4');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (7, 'GERARDO BARCIA', '04126785511', NULL, true, 'J-00000000-0');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (8, 'ANDREA DE SOUSA', '04162230099', NULL, true, 'J-00000000-0');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (9, 'DIANA URIBE', '04142235544', NULL, true, 'J-00000000-0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EVENTO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EVENTO` (`id`, `estado`, `nombre`, `fechaInicio`, `fechaFin`, `cantidadPersonas`, `horaInicio`, `horaFin`, `idTipoEvento`, `rifEmpresa`, `idContacto`, `nota`) VALUES (1, 'T', 'GRADUACION', '2010-09-19', '2010-09-20', 50, '18:00:00', '23:00:00', 1, 'J-00000000-0', 7, NULL);
INSERT INTO `banquetes`.`EVENTO` (`id`, `estado`, `nombre`, `fechaInicio`, `fechaFin`, `cantidadPersonas`, `horaInicio`, `horaFin`, `idTipoEvento`, `rifEmpresa`, `idContacto`, `nota`) VALUES (2, 'T', 'BODA', '2010-09-17', '2010-09-17', 60, '17:00:00', '23:00:00', 6, 'J-00000000-0', 8, 'ROSAS ROJAS');
INSERT INTO `banquetes`.`EVENTO` (`id`, `estado`, `nombre`, `fechaInicio`, `fechaFin`, `cantidadPersonas`, `horaInicio`, `horaFin`, `idTipoEvento`, `rifEmpresa`, `idContacto`, `nota`) VALUES (3, 'C', 'CONFERENCIA KRAFT', '2010-09-18', '2010-09-20', 30, '12:00:00', '16:00:00', 4, 'J-30131018-7', 5, NULL);
INSERT INTO `banquetes`.`EVENTO` (`id`, `estado`, `nombre`, `fechaInicio`, `fechaFin`, `cantidadPersonas`, `horaInicio`, `horaFin`, `idTipoEvento`, `rifEmpresa`, `idContacto`, `nota`) VALUES (4, 'C', 'PRESENTACION NUEVO PRODUCTO AVON', '2010-09-20', '2010-09-21', 50, '11:00:00', '15:00:00', 3, 'J-00002735-8', 3, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`SALON`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (1, 'DIPLOMAT', '1000', true, NULL);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (2, 'EMBAJADOR', '700', true, 1);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (3, 'PRESIDENTE', '850', true, 1);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (4, 'CONSUL', '600', true, 1);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (5, 'GOBERNADOR', '900', true, NULL);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (6, 'GOLD', '400', true, NULL);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (7, 'SILVER', '1000', true, NULL);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (8, 'PLATINUM', '750', true, NULL);
INSERT INTO `banquetes`.`SALON` (`id`, `nombre`, `costo`, `habilitado`, `idSalon`) VALUES (9, 'MILLENIUM', '1000', true, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`MONTAJE`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (1, 'TEATRO');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (2, 'ESCUELA');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (3, 'U');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (4, 'COCTEL');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (5, 'IMPERIAL');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (6, 'MESAS REDONDAS');
INSERT INTO `banquetes`.`MONTAJE` (`id`, `tipoMontaje`) VALUES (7, 'ESPINA DE PESCADO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EVENTO_SALA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`, `visible`) VALUES (1, NULL, 7, 1, true);
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`, `visible`) VALUES (2, '205', 7, 2, true);
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`, `visible`) VALUES (2, NULL, 8, 2, true);
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`, `visible`) VALUES (3, '500', 9, 3, true);
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`, `visible`) VALUES (4, NULL, 6, 3, true);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`DEPARTAMENTO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`DEPARTAMENTO` (`id`, `nombre`) VALUES (1, 'BANQUETES');
INSERT INTO `banquetes`.`DEPARTAMENTO` (`id`, `nombre`) VALUES (2, 'ALIMENTOS Y BEBIDAS');
INSERT INTO `banquetes`.`DEPARTAMENTO` (`id`, `nombre`) VALUES (3, 'COCINA');
INSERT INTO `banquetes`.`DEPARTAMENTO` (`id`, `nombre`) VALUES (4, 'AMA DE LLAVES');
INSERT INTO `banquetes`.`DEPARTAMENTO` (`id`, `nombre`) VALUES (5, 'BOTONES');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`SERVICIO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (1, 'PODIUM CON SONIDO', NULL, '100', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (2, 'PODIUM SIN SONIDO', NULL, '60', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (3, 'PANTALLA GRANDE', NULL, '400', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (4, 'PANTALLA PEQUENA', NULL, '250', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (5, 'ROTAFOLIOS', NULL, '100', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (6, 'VIDEO BEAM', NULL, '600', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (7, 'RETROPROYECTOR', NULL, '400', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (8, 'PROYECTOR DIAPOSITIVAS', NULL, '250', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (9, 'TELEVISOR 20', NULL, '500', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (10, 'RADIO CD', NULL, '200', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (11, 'SONIDO', NULL, '500', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (12, 'CORNETAS', NULL, '800', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (13, 'MICROFONO', NULL, '100', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (14, 'TELEFONO', NULL, '60', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (15, 'PIZARRA ACRILICA', NULL, '60', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (16, 'APUNTADOR LASER', NULL, '80', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (17, 'MAQUINA DE HUMO', NULL, '300', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (18, 'MEGAFONO', NULL, '250', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (19, 'DVD', NULL, '100', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (20, 'LAPTOP', NULL, '500', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (21, 'TARIMA', NULL, '100', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (22, 'WI-FI', NULL, '80', 'AU', true, 1);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (23, 'COFFEE BREAK 01', 'CAFE REGULAR O DESCAFEINADO, TE Y LECHE.\nJUGO DE FRUTAS FRESCAS: DOS SABORES A ELECCION. CROISSANTS DE JAMON Y QUESO.\nPASTELITOS DE RICOTA Y ESPINACA.', '70', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (24, 'COFFEE BREAK 02', 'DESCRIPCION DEL COFFEE BREAK 2', '90', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (25, 'COFFEE BREAK 03', 'DESCRIPCION DEL COFFEE BREAK 3', '70', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (26, 'COFFEE BREAK 04', 'DESCRIPCION DEL COFFEE BREAK 4', '90', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (27, 'COFFEE BREAK 05', 'DESCRIPCION DEL COFFEE BREAK 5', '100', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (28, 'COFFEE BREAK 06', 'DESCRIPCION DEL COFFEE BREAK 6', '75', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (29, 'SERVICIO OTRO', 'DESCRIPCION DEL SERVICIO OTRO', '60', 'OT', true, 5);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`ROL`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`ROL` (`id`, `tipoRol`) VALUES (1, 'administrador');
INSERT INTO `banquetes`.`ROL` (`id`, `tipoRol`) VALUES (2, 'coordinador');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`USUARIO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`USUARIO` (`username`, `password`, `nombre`, `apellido`, `correo`, `idRol`) VALUES ('ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'Maria', 'Uribe', 'mariale.uribe@gmail.com', 1);
INSERT INTO `banquetes`.`USUARIO` (`username`, `password`, `nombre`, `apellido`, `correo`, `idRol`) VALUES ('HUGO', '827ccb0eea8a706c4c34a16891f84e7b', 'Hugo', 'Pedroza', 'hpedroza@gmail.com', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`IVA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`IVA` (`id`, `porcentaje`) VALUES (1, '12');

COMMIT;
