-- MySQL Script generated by MySQL Workbench
-- Wed Nov 15 01:02:00 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pbl6_shoes_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pbl6_shoes_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pbl6_shoes_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pbl6_shoes_shop` ;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`user` (
  `id` BIGINT NOT NULL,
  `create_at` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `mobile` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`address` (
  `id` BIGINT NOT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `mobile` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `street_address` VARCHAR(255) NULL DEFAULT NULL,
  `zip_code` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`cart` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `discount` INT NOT NULL,
  `total_discounted_price` INT NOT NULL,
  `total_item` INT NULL DEFAULT NULL,
  `total_price` DOUBLE NULL DEFAULT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;





-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`category` (
  `id` BIGINT NOT NULL,
  `level` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `parent_category_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKs2ride9gvilxy2tcuv7witnxc`
    FOREIGN KEY (`parent_category_id`)
    REFERENCES `pbl6_shoes_shop`.`category` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`product` (
  `id` BIGINT NOT NULL,
  `brand` VARCHAR(255) NULL DEFAULT NULL,
  `color` VARCHAR(255) NULL DEFAULT NULL,
  `create_at` DATETIME(6) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `discount_persent` INT NULL DEFAULT NULL,
  `discounted_price` INT NULL DEFAULT NULL,
  `image_url` VARCHAR(255) NULL DEFAULT NULL,
  `num_ratings` INT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s`
    FOREIGN KEY (`category_id`)
    REFERENCES `pbl6_shoes_shop`.`category` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`cart_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`cart_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `discounted_price` INT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  `size` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  `cart_id` BIGINT NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3`
    FOREIGN KEY (`cart_id`)
    REFERENCES `pbl6_shoes_shop`.`cart` (`id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv`
    FOREIGN KEY (`product_id`)
    REFERENCES `pbl6_shoes_shop`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`orders` (
  `id` BIGINT NOT NULL,
  `create_at` DATETIME(6) NULL DEFAULT NULL,
  `delivery_date` DATETIME(6) NULL DEFAULT NULL,
  `discount` INT NULL DEFAULT NULL,
  `order_date` DATETIME(6) NULL DEFAULT NULL,
  `order_id` VARCHAR(255) NULL DEFAULT NULL,
  `order_status` VARCHAR(255) NULL DEFAULT NULL,
  `total_discounted_price` INT NULL DEFAULT NULL,
  `total_item` INT NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `shipping_address_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`),
  CONSTRAINT `FKh0uue95ltjysfmkqb5abgk7tj`
    FOREIGN KEY (`shipping_address_id`)
    REFERENCES `pbl6_shoes_shop`.`address` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`order_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `delivery_date` DATETIME(6) NULL DEFAULT NULL,
  `discounted_price` INT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  `size` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  `order_id` BIGINT NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna`
    FOREIGN KEY (`product_id`)
    REFERENCES `pbl6_shoes_shop`.`product` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt`
    FOREIGN KEY (`order_id`)
    REFERENCES `pbl6_shoes_shop`.`orders` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`payment_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`payment_information` (
  `user_id` BIGINT NOT NULL,
  `card_number` VARCHAR(255) NULL DEFAULT NULL,
  `cardholder_name` VARCHAR(255) NULL DEFAULT NULL,
  `cvv` VARCHAR(255) NULL DEFAULT NULL,
  `expiration_date` DATE NULL DEFAULT NULL,
  CONSTRAINT `FKcb0vkk9ey9j41no8yn0p60j95`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`product_sizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`product_sizes` (
  `product_id` BIGINT NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  CONSTRAINT `FK4w69qsh5hd062xv3hqkpgpdpu`
    FOREIGN KEY (`product_id`)
    REFERENCES `pbl6_shoes_shop`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`rating` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `create_at` DATETIME(6) NULL DEFAULT NULL,
  `rating` DOUBLE NULL DEFAULT NULL,
  `product_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKlkuwie0au2dru36asng9nywmh`
    FOREIGN KEY (`product_id`)
    REFERENCES `pbl6_shoes_shop`.`product` (`id`),
  CONSTRAINT `FKpn05vbx6usw0c65tcyuce4dw5`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pbl6_shoes_shop`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl6_shoes_shop`.`review` (
  `id` BIGINT NOT NULL,
  `create_at` DATETIME(6) NULL DEFAULT NULL,
  `review` VARCHAR(255) NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi`
    FOREIGN KEY (`user_id`)
    REFERENCES `pbl6_shoes_shop`.`user` (`id`),
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt`
    FOREIGN KEY (`product_id`)
    REFERENCES `pbl6_shoes_shop`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;