-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Flight_Booking_System
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Flight_Booking_System
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Flight_Booking_System` DEFAULT CHARACTER SET utf8 ;
USE `Flight_Booking_System` ;

-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`Passenger` (
  `passenger_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`Airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`Airport` (
  `airport_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `countery` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airport_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`Airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`Airline` (
  `airline_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`Flight` (
  `flight_id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(45) NOT NULL,
  `arrivel_datetime` DATETIME NOT NULL,
  `departure_datetime` DATETIME NOT NULL,
  `duration_min` INT NOT NULL,
  `distance_km` INT NOT NULL,
  `departure_airport_id` INT NOT NULL,
  `arrivle_airport_id` INT NOT NULL,
  `airline_id` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `flight_idx` (`departure_airport_id` ASC, `arrivle_airport_id` ASC) VISIBLE,
  INDEX `fk_Flight_Airline1_idx` (`airline_id` ASC) VISIBLE,
  CONSTRAINT `flight`
    FOREIGN KEY (`departure_airport_id` , `arrivle_airport_id`)
    REFERENCES `Flight_Booking_System`.`Airport` (`airport_id` , `airport_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Airline1`
    FOREIGN KEY (`airline_id`)
    REFERENCES `Flight_Booking_System`.`Airline` (`airline_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`FlightClass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`FlightClass` (
  `flightclass_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`flightclass_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_Booking_System`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_Booking_System`.`Booking` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `ticket_number` VARCHAR(50) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `confermation_number` VARCHAR(45) NOT NULL,
  `passenger_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  `flightclass_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_Booking_Passenger1_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_Booking_Flight1_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_Booking_FlightClass1_idx` (`flightclass_id` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Passenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `Flight_Booking_System`.`Passenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_Flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `Flight_Booking_System`.`Flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_FlightClass1`
    FOREIGN KEY (`flightclass_id`)
    REFERENCES `Flight_Booking_System`.`FlightClass` (`flightclass_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
