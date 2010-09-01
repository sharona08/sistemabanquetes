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
  `direccion` VARCHAR(200) NULL ,
  `habilitado` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`rif`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`TIPO_EVENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`TIPO_EVENTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`TIPO_EVENTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `tipoEvento` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`CONTACTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`CONTACTO` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`CONTACTO` (
  `id` INT(11)  NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NULL ,
  `direccion` VARCHAR(200) NULL ,
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
  `nombre` VARCHAR(50) NOT NULL ,
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
  `tipoMontaje` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `tipoMontaje_UNIQUE` (`tipoMontaje` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banquetes`.`DETALLE_SALA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banquetes`.`DETALLE_SALA` ;

CREATE  TABLE IF NOT EXISTS `banquetes`.`DETALLE_SALA` (
  `idSalon` INT(11)  NOT NULL ,
  `idMontaje` INT(11)  NOT NULL ,
  `capacidad` INT(11)  NULL ,
  PRIMARY KEY (`idSalon`, `idMontaje`) ,
  INDEX `fk_SALON_has_MONTAJE_SALON1` (`idSalon` ASC) ,
  INDEX `fk_SALON_has_MONTAJE_MONTAJE1` (`idMontaje` ASC) ,
  CONSTRAINT `fk_SALON_has_MONTAJE_SALON1`
    FOREIGN KEY (`idSalon` )
    REFERENCES `banquetes`.`SALON` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALON_has_MONTAJE_MONTAJE1`
    FOREIGN KEY (`idMontaje` )
    REFERENCES `banquetes`.`MONTAJE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idEvento`, `idSalon`) ,
  INDEX `fk_EVENTO_SALA_EVENTO1` (`idEvento` ASC) ,
  INDEX `fk_EVENTO_SALA_DETALLE_SALA1` (`idSalon` ASC, `idMontaje` ASC) ,
  CONSTRAINT `fk_EVENTO_SALA_EVENTO1`
    FOREIGN KEY (`idEvento` )
    REFERENCES `banquetes`.`EVENTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_SALA_DETALLE_SALA1`
    FOREIGN KEY (`idSalon` , `idMontaje` )
    REFERENCES `banquetes`.`DETALLE_SALA` (`idSalon` , `idMontaje` )
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
  `nombre` VARCHAR(100) NOT NULL ,
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
  `descripcion` VARCHAR(500) NULL ,
  `costoUnitario` DOUBLE NOT NULL ,
  `tipoServicio` VARCHAR(100) NOT NULL ,
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
  `cantidad` INT(11)  NOT NULL ,
  `horaInicio` TIME NOT NULL ,
  `horaFin` TIME NULL DEFAULT NULL ,
  `notaEspecial` VARCHAR(500) NULL DEFAULT NULL ,
  `nuevoCosto` DOUBLE NULL ,
  `nuevoNombre` VARCHAR(100) NULL ,
  `nuevaDescripcion` VARCHAR(500) NULL ,
  PRIMARY KEY (`idServicio`, `idEvento`) ,
  INDEX `fk_SERVICIO_has_EVENTO_SERVICIO1` (`idServicio` ASC) ,
  INDEX `fk_SERVICIO_has_EVENTO_EVENTO1` (`idEvento` ASC) ,
  CONSTRAINT `fk_SERVICIO_has_EVENTO_SERVICIO1`
    FOREIGN KEY (`idServicio` )
    REFERENCES `banquetes`.`SERVICIO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SERVICIO_has_EVENTO_EVENTO1`
    FOREIGN KEY (`idEvento` )
    REFERENCES `banquetes`.`EVENTO` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EMPRESA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-00000000-0', 'PARTICULAR', NULL, NULL, true);
INSERT INTO `banquetes`.`EMPRESA` (`rif`, `nombre`, `telefono`, `direccion`, `habilitado`) VALUES ('J-29565286-0', 'HBP, C.A.', '02128776788', 'Av. Francisco de Miranda, Centro Plaza, Torre C, Piso 15, Oficina H. - Los Palos Grandes', true);

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
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (1, 'GERARDO BARCIA', NULL, NULL, true, 'J-29565286-0');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (2, 'ANDREA PEREZ', '04124458736', 'LOS RUICES', true, 'J-00000000-0');
INSERT INTO `banquetes`.`CONTACTO` (`id`, `nombre`, `telefono`, `direccion`, `habilitado`, `rifEmpresa`) VALUES (3, 'EDUARDO GOMEZ', '02128876545', 'MONTALBAN', true, 'J-00000000-0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EVENTO`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EVENTO` (`id`, `estado`, `nombre`, `fechaInicio`, `fechaFin`, `cantidadPersonas`, `horaInicio`, `horaFin`, `idTipoEvento`, `rifEmpresa`, `idContacto`) VALUES (1, 'T', 'GRADUACION', '2010-08-14', '2010-08-16', 50, '18:00:00', '23:00:00', 1, 'J-00000000-0', 2);

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
-- Data for table `banquetes`.`DETALLE_SALA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 1, 50);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 2, 60);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 3, 40);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 4, 30);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 5, 35);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 6, 33);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (1, 7, 35);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 1, 60);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (2, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (3, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (4, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (5, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (6, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (7, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (8, 7, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 1, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 2, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 3, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 4, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 5, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 6, NULL);
INSERT INTO `banquetes`.`DETALLE_SALA` (`idSalon`, `idMontaje`, `capacidad`) VALUES (9, 7, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `banquetes`.`EVENTO_SALA`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `banquetes`;
INSERT INTO `banquetes`.`EVENTO_SALA` (`idEvento`, `nuevoCosto`, `idSalon`, `idMontaje`) VALUES (1, NULL, 4, 1);

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
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (23, 'COFFEE BREAK 1', 'DESCRIPCION DEL COFFEE BREAK 1', '50', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (24, 'COFFEE BREAK 2', 'DESCRIPCION DEL COFFEE BREAK 2', '50', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (25, 'COFFEE BREAK 3', 'DESCRIPCION DEL COFFEE BREAK 3', '50', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (26, 'COFFEE BREAK 4', 'DESCRIPCION DEL COFFEE BREAK 4', '50', 'AB', true, 3);
INSERT INTO `banquetes`.`SERVICIO` (`id`, `nombre`, `descripcion`, `costoUnitario`, `tipoServicio`, `habilitado`, `idDepartamento`) VALUES (27, 'COFFEE BREAK 5', 'DESCRIPCION DEL COFFEE BREAK 5', '45', 'AB', true, 3);

COMMIT;
