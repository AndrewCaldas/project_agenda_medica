-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AGENDA_MEDICA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AGENDA_MEDICA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AGENDA_MEDICA` DEFAULT CHARACTER SET utf8 ;
USE `AGENDA_MEDICA` ;

-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`PERFIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`PERFIL` (
  `ID_PERFIL` TINYINT(1) UNSIGNED NOT NULL,
  `NOME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_PERFIL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`LOGIN` (
  `ID_LOGIN` INT UNSIGNED NOT NULL,
  `ID_PERFIL` TINYINT(1) UNSIGNED NOT NULL,
  `ACESSO_SISTEMA` TINYINT(1) UNSIGNED NOT NULL,
  `LOGIN` VARCHAR(45) NOT NULL,
  `SENHA` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_LOGIN`),
  UNIQUE INDEX `LOGIN_UNIQUE` (`LOGIN` ASC),
  CONSTRAINT `FK_PERFIL_LOGIN`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `AGENDA_MEDICA`.`PERFIL` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`CREDENCIADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`CREDENCIADO` (
  `ID_CREDENCIADO` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_LOGIN` INT UNSIGNED NOT NULL,
  `NOME` VARCHAR(70) NULL,
  `CPF`INT UNSIGNED NULL,
  `NASCIMENTO` DATE NULL,
  `ENDERECO` VARCHAR(70) NULL,
  `CEP` INT UNSIGNED NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `TELEFONE` INT UNSIGNED NULL,
  `CELULAR` INT UNSIGNED NULL,
  `FOTO` BLOB NULL,
  `CONVENIO` VARCHAR(1) NULL,
  PRIMARY KEY (`ID_CREDENCIADO`, `ID_LOGIN`),
  INDEX `FK_LOGIN_CREDENCIADO_idx` (`ID_LOGIN` ASC),
  CONSTRAINT `FK_LOGIN_CREDENCIADO`
    FOREIGN KEY (`ID_LOGIN`)
    REFERENCES `AGENDA_MEDICA`.`LOGIN` (`ID_LOGIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`CLINICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`CLINICA` (
  `ID_CLINICA` INT UNSIGNED NOT NULL,
  `ID_LOGIN` INT UNSIGNED NOT NULL,
  `CNPJ` INT UNSIGNED NULL,
  `NOME` VARCHAR(45) NULL,
  `ENDERECO` VARCHAR(45) NULL,
  `CEP` INT UNSIGNED NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `TELEFONE` INT UNSIGNED NULL,
  `RESPONSAVEL` VARCHAR(45) NULL,
  `CPF_RESPONSAVEL` INT UNSIGNED NULL,
  `LOGO_CLINICA` BLOB NULL,
  PRIMARY KEY (`ID_CLINICA`, `ID_LOGIN`),
  INDEX `FK_LOGIN_CLINICA_idx` (`ID_LOGIN` ASC),
  CONSTRAINT `FK_LOGIN_CLINICA`
    FOREIGN KEY (`ID_LOGIN`)
    REFERENCES `AGENDA_MEDICA`.`LOGIN` (`ID_LOGIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`MEDICO` (
  `ID_MEDICO` INT UNSIGNED NOT NULL,
  `ID_LOGIN` INT UNSIGNED NOT NULL,
  `ID_CLINICA` INT UNSIGNED NOT NULL,
  `NOME` VARCHAR(70) NULL,
  `CPF` INT UNSIGNED NULL,
  `CRM` INT UNSIGNED NULL,
  `NASCIMENTO` DATE NULL,
  `ENDERECO` VARCHAR(70) NULL,
  `CEP` INT UNSIGNED NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `TELEFONE` INT UNSIGNED NULL,
  `CELULAR` INT UNSIGNED NULL,
  `FOTO` BLOB NULL,
  PRIMARY KEY (`ID_MEDICO`, `ID_LOGIN`),
  INDEX `FK_LOGIN_CREDENCIADO_idx` (`ID_LOGIN` ASC),
  INDEX `FK_CLINICA_MEDICO_idx` (`ID_CLINICA` ASC),
  CONSTRAINT `FK_LOGIN_MEDICO`
    FOREIGN KEY (`ID_LOGIN`)
    REFERENCES `AGENDA_MEDICA`.`LOGIN` (`ID_LOGIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLINICA_MEDICO`
    FOREIGN KEY (`ID_CLINICA`)
    REFERENCES `AGENDA_MEDICA`.`CLINICA` (`ID_CLINICA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`ATENDENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`ATENDENTE` (
  `ID_ATENDENTE` INT UNSIGNED NOT NULL,
  `ID_LOGIN` INT UNSIGNED NOT NULL,
  `ID_CLINICA` INT UNSIGNED NOT NULL,
  `NOME` VARCHAR(70) NULL,
  `CPF` INT UNSIGNED NULL,
  `NASCIMENTO` DATE NULL,
  `ENDERECO` VARCHAR(70) NULL,
  `CEP` INT UNSIGNED NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `TELEFONE` INT UNSIGNED NULL,
  `CELULAR` INT UNSIGNED NULL,
  `FOTO` BLOB NULL,
  PRIMARY KEY (`ID_ATENDENTE`, `ID_LOGIN`),
  INDEX `FK_LOGIN_CREDENCIADO_idx` (`ID_LOGIN` ASC),
  INDEX `FK_CLINICA_ATENDENTE_idx` (`ID_CLINICA` ASC),
  CONSTRAINT `FK_LOGIN_CREDENCIADO0`
    FOREIGN KEY (`ID_LOGIN`)
    REFERENCES `AGENDA_MEDICA`.`LOGIN` (`ID_LOGIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLINICA_ATENDENTE`
    FOREIGN KEY (`ID_CLINICA`)
    REFERENCES `AGENDA_MEDICA`.`CLINICA` (`ID_CLINICA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`ESPECIALIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`ESPECIALIDADE` (
  `ID_ESPECIALIDADE` TINYINT(2) UNSIGNED NOT NULL,
  `NOME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_ESPECIALIDADE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`ESPECIALIDADE_MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`ESPECIALIDADE_MEDICO` (
  `ID_ESPECIALIDADE` TINYINT(2) UNSIGNED NOT NULL,
  `ID_MEDICO` INT UNSIGNED NOT NULL,
  INDEX `FK_ESPECIALIDADE_MED_idx` (`ID_MEDICO` ASC),
  CONSTRAINT `FK_ESPECIALIDADE`
    FOREIGN KEY (`ID_ESPECIALIDADE`)
    REFERENCES `AGENDA_MEDICA`.`ESPECIALIDADE` (`ID_ESPECIALIDADE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ESPECIALIDADE_MED`
    FOREIGN KEY (`ID_MEDICO`)
    REFERENCES `AGENDA_MEDICA`.`MEDICO` (`ID_MEDICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`AGENDA_MES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`AGENDA_MES` (
  `ID_AGENDA_MES` INT UNSIGNED NOT NULL,
  `MES` VARCHAR(10) NULL,
  `DIA` TINYINT(2) NULL,
  `HORA_INICIO` TIME NULL,
  `HORA_FINAL` TIME NULL,
  PRIMARY KEY (`ID_AGENDA_MES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`AGENDA_MEDICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`AGENDA_MEDICA` (
  `ID_MEDICO` INT UNSIGNED NOT NULL,
  `ID_AGENDA_MES` INT UNSIGNED NOT NULL,
  INDEX `FK_MEDICO_AGENDA_idx` (`ID_MEDICO` ASC),
  INDEX `FK_AGENDA_MES_idx` (`ID_AGENDA_MES` ASC),
  CONSTRAINT `FK_MEDICO_AGENDA`
    FOREIGN KEY (`ID_MEDICO`)
    REFERENCES `AGENDA_MEDICA`.`MEDICO` (`ID_MEDICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AGENDA_MES`
    FOREIGN KEY (`ID_AGENDA_MES`)
    REFERENCES `AGENDA_MEDICA`.`AGENDA_MES` (`ID_AGENDA_MES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AGENDA_MEDICA`.`CONSULTA_MEDICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AGENDA_MEDICA`.`CONSULTA_MEDICA` (
  `ID_CONSULTA_MEDICA` INT UNSIGNED NOT NULL,
  `ID_CREDENCIADO` INT UNSIGNED NOT NULL,
  `ID_MEDICO` INT UNSIGNED NOT NULL,
  `ID_CLINICA` INT UNSIGNED NOT NULL,
  `DATA` DATE NULL,
  `HORARIO` TIME NULL,
  `SOLICITADO_POR` INT UNSIGNED NOT NULL,
  `STATUS` VARCHAR(1) NULL,
  PRIMARY KEY (`ID_CONSULTA_MEDICA`),
  INDEX `FK_CREDENCIADO_CONSULTA_idx` (`ID_CREDENCIADO` ASC),
  INDEX `FK_MEDICO_CONSULTA_idx` (`ID_MEDICO` ASC),
  INDEX `FK_CLINICA_CONSULTA_idx` (`ID_CLINICA` ASC),
  INDEX `FK_LOGIN_CONSULTA_idx` (`SOLICITADO_POR` ASC),
  CONSTRAINT `FK_CREDENCIADO_CONSULTA`
    FOREIGN KEY (`ID_CREDENCIADO`)
    REFERENCES `AGENDA_MEDICA`.`CREDENCIADO` (`ID_CREDENCIADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MEDICO_CONSULTA`
    FOREIGN KEY (`ID_MEDICO`)
    REFERENCES `AGENDA_MEDICA`.`MEDICO` (`ID_MEDICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLINICA_CONSULTA`
    FOREIGN KEY (`ID_CLINICA`)
    REFERENCES `AGENDA_MEDICA`.`CLINICA` (`ID_CLINICA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LOGIN_CONSULTA`
    FOREIGN KEY (`SOLICITADO_POR`)
    REFERENCES `AGENDA_MEDICA`.`LOGIN` (`ID_LOGIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;