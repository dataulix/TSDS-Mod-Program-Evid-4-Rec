-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Carne_Disponible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carne_Disponible` (
  `idCarneDisponible` INT NOT NULL,
  `nombre_carne` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarneDisponible`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipologia` (
  `idTipologia` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipologia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Peso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peso` (
  `idPeso` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alimentos` (
  `idAlimento` INT NOT NULL,
  `idCarneDisponible` INT NOT NULL,
  `idTipologia` INT NOT NULL,
  `idPeso` INT NOT NULL,
  PRIMARY KEY (`idAlimento`),
  INDEX `idCarneDisponible_idx` (`idCarneDisponible` ASC) VISIBLE,
  INDEX `idTipologia_idx` (`idTipologia` ASC) VISIBLE,
  INDEX `idPeso_idx` (`idPeso` ASC) VISIBLE,
  CONSTRAINT `idCarneDisponible`
    FOREIGN KEY (`idCarneDisponible`)
    REFERENCES `mydb`.`Carne_Disponible` (`idCarneDisponible`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTipologia`
    FOREIGN KEY (`idTipologia`)
    REFERENCES `mydb`.`Tipologia` (`idTipologia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPeso`
    FOREIGN KEY (`idPeso`)
    REFERENCES `mydb`.`Peso` (`idPeso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use mydb

INSERT INTO carne_disponible VALUES 
('1', 'vaca');
INSERT INTO carne_disponible VALUES 
('2', 'cerdo');
INSERT INTO carne_disponible VALUES 
('3', 'pollo');
INSERT INTO carne_disponible VALUES 
('4', 'conejo');
INSERT INTO carne_disponible VALUES 
('5', 'pescado');

INSERT INTO peso VALUES 
('1', '1 kg');
INSERT INTO peso VALUES 
('2', '3 kg');
INSERT INTO peso VALUES 
('3', '5 kg');

INSERT INTO tipologia VALUES 
('1', 'cruda');
INSERT INTO tipologia VALUES 
('2', 'cocinada');

USE mydb

SELECT *
FROM carne_disponible

SELECT * 
FROM tipologia

SELECT *
FROM peso

SELECT *
FROM alimentos

SELECT idCarneDisponible, idPeso
FROM alimentos

SELECT idTipologia, idPeso
FROM alimentos



