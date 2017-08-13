-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema montolm_registerparts
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `montolm_registerparts` ;

-- -----------------------------------------------------
-- Schema montolm_registerparts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `montolm_registerparts` DEFAULT CHARACTER SET utf8 ;
USE `montolm_registerparts` ;

-- -----------------------------------------------------
-- Table `montolm_registerparts`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`category` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`category` (
  `id_category` INT(11) NOT NULL,
  `name_category` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  PRIMARY KEY (`name_category`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`combustible`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`combustible` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`combustible` (
  `id_combustible` INT(11) NOT NULL,
  `type_combustible` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  PRIMARY KEY (`type_combustible`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`generation_model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`generation_model` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`generation_model` (
  `id_generation` INT(11) NOT NULL,
  `id_model` INT(11) NOT NULL,
  `start_generation` INT(11) NOT NULL,
  `end_generation` INT(11) NOT NULL,
  `fec_actu` DATE NULL DEFAULT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_model`, `start_generation`, `end_generation`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`make`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`make` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`make` (
  `id_vehicle_make` INT(11) NOT NULL,
  `name_vehicle_make` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  PRIMARY KEY (`name_vehicle_make`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`model_combustible`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`model_combustible` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`model_combustible` (
  `id_combustible_model` INT(11) NOT NULL,
  `id_combustible` INT(11) NOT NULL,
  `id_model` INT(11) NOT NULL,
  `fec_actu` DATE NULL DEFAULT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_combustible`, `id_model`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`part` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`part` (
  `id_part` INT(11) NOT NULL,
  `name_part` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  `id_category` INT(11) NOT NULL,
  PRIMARY KEY (`name_part`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`part_vehicle_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`part_vehicle_type` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`part_vehicle_type` (
  `id` INT(11) NOT NULL,
  `id_category` INT(11) NOT NULL,
  `id_vehicle_type` INT(11) NOT NULL,
  `id_part` INT(11) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  PRIMARY KEY (`id_category`, `id_vehicle_type`, `id_part`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`type_vehicle_motor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`type_vehicle_motor` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`type_vehicle_motor` (
  `id_type_vehicle_motor` INT(11) NOT NULL,
  `type_name_vehicle` VARCHAR(45) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  PRIMARY KEY (`type_name_vehicle`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`user` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`user` (
  `id_username` INT(11) NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(85) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`username`, `email`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`vehicle_model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`vehicle_model` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`vehicle_model` (
  `id_model` INT(11) NOT NULL,
  `model_name` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  `id_vehicle_make` INT(11) NOT NULL,
  PRIMARY KEY (`model_name`, `mca_inh`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `montolm_registerparts`.`vehicle_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `montolm_registerparts`.`vehicle_type` ;

CREATE TABLE IF NOT EXISTS `montolm_registerparts`.`vehicle_type` (
  `id_vehicle_type` INT(11) NOT NULL,
  `name_vehicle_type` VARCHAR(25) NOT NULL,
  `creation_date` DATE NOT NULL,
  `fec_actu` DATE NOT NULL,
  `mca_inh` VARCHAR(1) NOT NULL,
  `id_username` INT(11) NOT NULL,
  `id_type_vehicle_motor` INT(11) NOT NULL,
  `id_vehicle_make` INT(11) NOT NULL,
  `id_model` INT(11) NOT NULL,
  `id_generation` INT(11) NOT NULL,
  PRIMARY KEY (`name_vehicle_type`, `mca_inh`, `id_type_vehicle_motor`, `id_vehicle_make`, `id_model`, `id_generation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;