-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema c4h
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `c4h` ;

-- -----------------------------------------------------
-- Schema c4h
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `c4h` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `c4h` ;

-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_usuario` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_usuario` (
                                                     `id_usuario` VARCHAR(40) NOT NULL,
                                                     `nm_login` VARCHAR(30) NOT NULL,
                                                     `nm_email` VARCHAR(100) NULL DEFAULT NULL,
                                                     `vl_senha` VARCHAR(100) NOT NULL,
                                                     `st_admin` TINYINT(1) NULL DEFAULT NULL,
                                                     `st_doador` TINYINT(1) NULL DEFAULT NULL,
                                                     `st_assinante` TINYINT(1) NULL DEFAULT NULL,
                                                     `st_colaborador` TINYINT(1) NULL DEFAULT NULL,
                                                     `st_voluntario` TINYINT(1) NULL DEFAULT NULL,
                                                     `nm_razao_social` VARCHAR(100) NULL DEFAULT NULL,
                                                     `nm_nome` VARCHAR(100) NULL DEFAULT NULL,
                                                     `vl_cpf` DECIMAL(11,0) NULL DEFAULT NULL,
                                                     `vl_cnpj` VARCHAR(14) NULL DEFAULT NULL,
                                                     `dt_nascimento` DATE NULL DEFAULT NULL,
                                                     `vl_url` VARCHAR(100) NULL DEFAULT NULL,
                                                     `dt_criacao` DATE NULL DEFAULT NULL,
                                                     `fl_foto` MEDIUMBLOB NULL DEFAULT NULL,
                                                     PRIMARY KEY (`id_usuario`),
                                                     UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_assinatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_assinatura` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_assinatura` (
                                                        `id_assinatura` VARCHAR(40) NOT NULL,
                                                        `vl_doacao` FLOAT NULL DEFAULT NULL,
                                                        `nr_dia_doacao` DECIMAL(2,0) NULL DEFAULT NULL,
                                                        `dt_inicio` DATE NULL DEFAULT NULL,
                                                        `dt_fim` DATE NULL DEFAULT NULL,
                                                        `st_ativa` TINYINT(1) NULL DEFAULT NULL,
                                                        `id_usuario` VARCHAR(40) NOT NULL,
                                                        PRIMARY KEY (`id_assinatura`, `id_usuario`),
                                                        INDEX `fk_t_c4h_assinatura_t_c4h_usuario_idx` (`id_usuario` ASC) VISIBLE,
                                                        CONSTRAINT `fk_t_c4h_assinatura_t_c4h_usuario`
                                                            FOREIGN KEY (`id_usuario`)
                                                                REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_blog_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_blog_entry` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_blog_entry` (
                                                        `id_blog` VARCHAR(40) NOT NULL,
                                                        `nm_titulo` VARCHAR(100) NULL DEFAULT NULL,
                                                        `fl_imagem` LONGBLOB NULL DEFAULT NULL,
                                                        `tx_conteudo` LONGTEXT NULL DEFAULT NULL,
                                                        `st_mostra` TINYINT(1) NULL DEFAULT NULL,
                                                        `st_destaque` TINYINT(1) NULL DEFAULT NULL,
                                                        `dt_publicacao` DATE NULL DEFAULT NULL,
                                                        `id_usuario` VARCHAR(40) NOT NULL,
                                                        PRIMARY KEY (`id_blog`, `id_usuario`),
                                                        INDEX `fk_t_c4h_blog_entry_t_c4h_usuario1_idx` (`id_usuario` ASC) VISIBLE,
                                                        CONSTRAINT `fk_t_c4h_blog_entry_t_c4h_usuario1`
                                                            FOREIGN KEY (`id_usuario`)
                                                                REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_doacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_doacao` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_doacao` (
                                                    `id_doacao` VARCHAR(40) NOT NULL,
                                                    `dt_data_doacao` DATE NULL DEFAULT NULL,
                                                    `vl_doacao` FLOAT NULL DEFAULT NULL,
                                                    `id_usuario` VARCHAR(40) NOT NULL,
                                                    PRIMARY KEY (`id_doacao`, `id_usuario`),
                                                    INDEX `fk_t_c4h_doacao_t_c4h_usuario1_idx` (`id_usuario` ASC) VISIBLE,
                                                    CONSTRAINT `fk_t_c4h_doacao_t_c4h_usuario1`
                                                        FOREIGN KEY (`id_usuario`)
                                                            REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_logradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_logradouro` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_logradouro` (
                                                        `id_logradouro` VARCHAR(40) NOT NULL,
                                                        `nm_tipo` VARCHAR(20) NULL DEFAULT NULL,
                                                        `nm_logradouro` VARCHAR(150) NULL DEFAULT NULL,
                                                        `nr_logradouro` DECIMAL(6,0) NULL DEFAULT NULL,
                                                        `nr_cep` DECIMAL(8,0) NULL DEFAULT NULL,
                                                        `vl_complemento` VARCHAR(30) NULL DEFAULT NULL,
                                                        `nm_bairro` VARCHAR(100) NULL DEFAULT NULL,
                                                        `nm_cidade` VARCHAR(100) NULL DEFAULT NULL,
                                                        `nm_estado` VARCHAR(2) NULL DEFAULT NULL,
                                                        `id_usuario` VARCHAR(40) NOT NULL,
                                                        PRIMARY KEY (`id_logradouro`, `id_usuario`),
                                                        INDEX `fk_t_c4h_logradouro_t_c4h_usuario1_idx` (`id_usuario` ASC) VISIBLE,
                                                        CONSTRAINT `fk_t_c4h_logradouro_t_c4h_usuario1`
                                                            FOREIGN KEY (`id_usuario`)
                                                                REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_tipo_rede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_tipo_rede` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_tipo_rede` (
                                                       `id_tipo_rede` VARCHAR(40) NOT NULL,
                                                       `nm_nome` VARCHAR(150) NULL DEFAULT NULL,
                                                       `fl_logo` MEDIUMBLOB NULL DEFAULT NULL,
                                                       PRIMARY KEY (`id_tipo_rede`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_redes_sociais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_redes_sociais` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_redes_sociais` (
                                                           `id_rede_social` VARCHAR(40) NOT NULL,
                                                           `nm_url` VARCHAR(150) NULL DEFAULT NULL,
                                                           `id_usuario` VARCHAR(40) NOT NULL,
                                                           `id_tipo_rede` VARCHAR(40) NOT NULL,
                                                           PRIMARY KEY (`id_rede_social`, `id_usuario`, `id_tipo_rede`),
                                                           INDEX `fk_t_c4h_redes_sociais_t_c4h_usuario1_idx` (`id_usuario` ASC) VISIBLE,
                                                           INDEX `fk_t_c4h_redes_sociais_t_c4h_tipo_rede2_idx` (`id_tipo_rede` ASC) VISIBLE,
                                                           CONSTRAINT `fk_t_c4h_redes_sociais_t_c4h_tipo_rede2`
                                                               FOREIGN KEY (`id_tipo_rede`)
                                                                   REFERENCES `c4h`.`t_c4h_tipo_rede` (`id_tipo_rede`),
                                                           CONSTRAINT `fk_t_c4h_redes_sociais_t_c4h_usuario1`
                                                               FOREIGN KEY (`id_usuario`)
                                                                   REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_telefone` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_telefone` (
                                                      `id_telefone` VARCHAR(40) NOT NULL,
                                                      `nr_telefone` DECIMAL(12,0) NULL DEFAULT NULL,
                                                      `nr_ddd` DECIMAL(3,0) NULL DEFAULT NULL,
                                                      `id_usuario` VARCHAR(40) NOT NULL,
                                                      PRIMARY KEY (`id_telefone`, `id_usuario`),
                                                      INDEX `fk_t_c4h_telefone_t_c4h_usuario1_idx` (`id_usuario` ASC) VISIBLE,
                                                      CONSTRAINT `fk_t_c4h_telefone_t_c4h_usuario1`
                                                          FOREIGN KEY (`id_usuario`)
                                                              REFERENCES `c4h`.`t_c4h_usuario` (`id_usuario`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_categorias` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_categorias` (
                                                        `id_categoria` VARCHAR(40) NOT NULL,
                                                        `nm_categoria` VARCHAR(100) NOT NULL,
                                                        PRIMARY KEY (`id_categoria`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c4h`.`t_c4h_categorias_blog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `c4h`.`t_c4h_categorias_blog` ;

CREATE TABLE IF NOT EXISTS `c4h`.`t_c4h_categorias_blog` (
                                                             `id_categoria_blog` VARCHAR(40) NOT NULL,
                                                             `id_blog` VARCHAR(40) NOT NULL,
                                                             `id_categoria` VARCHAR(40) NOT NULL,
                                                             PRIMARY KEY (`id_categoria_blog`),
                                                             INDEX `fk_t_c4h_categorias_blog_t_c4h_blog_entry1_idx` (`id_blog` ASC) VISIBLE,
                                                             INDEX `fk_t_c4h_categorias_blog_t_c4h_categorias1_idx` (`id_categoria` ASC) VISIBLE,
                                                             CONSTRAINT `fk_t_c4h_categorias_blog_t_c4h_blog_entry1`
                                                                 FOREIGN KEY (`id_blog`)
                                                                     REFERENCES `c4h`.`t_c4h_blog_entry` (`id_blog`)
                                                                     ON DELETE NO ACTION
                                                                     ON UPDATE NO ACTION,
                                                             CONSTRAINT `fk_t_c4h_categorias_blog_t_c4h_categorias1`
                                                                 FOREIGN KEY (`id_categoria`)
                                                                     REFERENCES `c4h`.`t_c4h_categorias` (`id_categoria`)
                                                                     ON DELETE NO ACTION
                                                                     ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
