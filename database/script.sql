-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema overalldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `overalldb` ;

-- -----------------------------------------------------
-- Schema overalldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `overalldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `overalldb` ;

-- -----------------------------------------------------
-- Table `overalldb`.`tipo_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`tipo_user` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `overalldb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`users` (
  `id` BIGINT UNSIGNED NOT NULL,
  `identification` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `cellphone` INT NULL DEFAULT NULL,
  `tipo_user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tipo_user_id`),
  INDEX `fk_users_tipo_user1_idx` (`tipo_user_id` ASC) VISIBLE,
  UNIQUE INDEX `indetification_UNIQUE` (`identification` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_users_tipo_user1`
    FOREIGN KEY (`tipo_user_id`)
    REFERENCES `overalldb`.`tipo_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`cart` (
  `id` BIGINT NOT NULL,
  `subtotal` BIGINT NULL DEFAULT NULL,
  `total` BIGINT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `users_id` BIGINT UNSIGNED NOT NULL,
  `users_cart_id` BIGINT NOT NULL,
  `users_tipo_user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `users_cart_id`, `users_tipo_user_id`),
  INDEX `fk_cart_users1_idx` (`users_id` ASC, `users_cart_id` ASC, `users_tipo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_users1`
    FOREIGN KEY (`users_id` , `users_tipo_user_id`)
    REFERENCES `overalldb`.`users` (`id` , `tipo_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`state_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`state_order` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `overalldb`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`stores` (
  `id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `image` BLOB NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`order` (
  `id` BIGINT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `users_id` BIGINT UNSIGNED NOT NULL,
  `state_order_id` INT NOT NULL,
  `stores_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_order_state_order1_idx` (`state_order_id` ASC) VISIBLE,
  INDEX `fk_order_stores1_idx` (`stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `overalldb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_state_order1`
    FOREIGN KEY (`state_order_id`)
    REFERENCES `overalldb`.`state_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_stores1`
    FOREIGN KEY (`stores_id`)
    REFERENCES `overalldb`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`state_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`state_product` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `overalldb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `overalldb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`products` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `brand` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NULL,
  `barcode` BIGINT NOT NULL,
  `stock` INT NOT NULL,
  `price` BIGINT NOT NULL,
  `image` BLOB NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  `stores_id` BIGINT UNSIGNED NOT NULL,
  `state_product_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_stores1_idx` (`stores_id` ASC) VISIBLE,
  INDEX `fk_products_state_product1_idx` (`state_product_id` ASC) VISIBLE,
  INDEX `fk_products_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_stores1`
    FOREIGN KEY (`stores_id`)
    REFERENCES `overalldb`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_state_product1`
    FOREIGN KEY (`state_product_id`)
    REFERENCES `overalldb`.`state_product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `overalldb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`products_has_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`products_has_cart` (
  `products_id` INT NOT NULL,
  `cart_id` BIGINT NOT NULL,
  PRIMARY KEY (`products_id`, `cart_id`),
  INDEX `fk_products_has_cart_cart1_idx` (`cart_id` ASC) VISIBLE,
  INDEX `fk_products_has_cart_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_cart_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `overalldb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_cart_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `overalldb`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`users_has_stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`users_has_stores` (
  `users_id` BIGINT UNSIGNED NOT NULL,
  `users_tipo_user_id` INT NOT NULL,
  `stores_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`users_id`, `users_tipo_user_id`, `stores_id`),
  INDEX `fk_users_has_stores_stores1_idx` (`stores_id` ASC) VISIBLE,
  INDEX `fk_users_has_stores_users1_idx` (`users_id` ASC, `users_tipo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_stores_users1`
    FOREIGN KEY (`users_id` , `users_tipo_user_id`)
    REFERENCES `overalldb`.`users` (`id` , `tipo_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_stores_stores1`
    FOREIGN KEY (`stores_id`)
    REFERENCES `overalldb`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `overalldb`.`order_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `overalldb`.`order_has_products` (
  `order_id` BIGINT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `products_id`),
  INDEX `fk_order_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_order_has_products_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_has_products_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `overalldb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `overalldb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
