CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

-- -----------------------------------------------------
-- Table `Casas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casas` (
  `idCasa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `fundador` VARCHAR(45) NULL,
  `cores` VARCHAR(100) NULL,
  `mascote` VARCHAR(45) NULL,
  `fantasma` VARCHAR(45) NULL,
  PRIMARY KEY (`idCasa`)
);

-- -----------------------------------------------------
-- Table `Varinhas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Varinhas` (
  `idVarinha` INT NOT NULL AUTO_INCREMENT,
  `nucleo` VARCHAR(45) NULL,
  `madeira` VARCHAR(45) NULL,
  `comprimento` FLOAT NULL,
  `flexibilidade` VARCHAR(100) NULL,
  PRIMARY KEY (`idVarinha`)
);

-- -----------------------------------------------------
-- Table `Bruxos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bruxos` (
  `idBruxos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `Casas_idCasa` INT NOT NULL,
  `Varinhas_idVarinha` INT NULL,  -- Agora permite NULL para evitar erro de ON DELETE SET NULL
  PRIMARY KEY (`idBruxos`),
  INDEX `fk_Bruxos_Casas_idx` (`Casas_idCasa` ASC) VISIBLE,
  INDEX `fk_Bruxos_Varinhas1_idx` (`Varinhas_idVarinha` ASC) VISIBLE,
  CONSTRAINT `fk_Bruxos_Casas`
    FOREIGN KEY (`Casas_idCasa`)
    REFERENCES `Casas` (`idCasa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bruxos_Varinhas1`
    FOREIGN KEY (`Varinhas_idVarinha`)
    REFERENCES `Varinhas` (`idVarinha`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `Feiticos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Feiticos` (
  `idFeitico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `efeito` VARCHAR(100) NOT NULL,
  `nivelDificuldade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFeitico`)
);

-- -----------------------------------------------------
-- Table `CriaturasMagicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CriaturasMagicas` (
  `idCriatura` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `periculosidade` VARCHAR(45) NULL,
  `habitat` VARCHAR(100) NULL,
  PRIMARY KEY (`idCriatura`)
);

-- -----------------------------------------------------
-- Table `Feiticos_has_Bruxos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Feiticos_has_Bruxos` (
  `Feiticos_idFeitico` INT NOT NULL,
  `Bruxos_idBruxos` INT NOT NULL,
  `nivelPericia` VARCHAR(45) NULL,
  PRIMARY KEY (`Feiticos_idFeitico`, `Bruxos_idBruxos`),
  CONSTRAINT `fk_Feiticos_has_Bruxos_Feiticos1`
    FOREIGN KEY (`Feiticos_idFeitico`)
    REFERENCES `Feiticos` (`idFeitico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Feiticos_has_Bruxos_Bruxos1`
    FOREIGN KEY (`Bruxos_idBruxos`)
    REFERENCES `Bruxos` (`idBruxos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `Bruxos_has_CriaturasMagicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bruxos_has_CriaturasMagicas` (
  `Bruxos_idBruxos` INT NOT NULL,
  `CriaturasMagicas_idCriatura` INT NOT NULL,
  `dataDeEncontro` DATE NULL,
  `statusDeInteracao` VARCHAR(45) NULL,
  PRIMARY KEY (`Bruxos_idBruxos`, `CriaturasMagicas_idCriatura`),
  CONSTRAINT `fk_Bruxos_has_CriaturasMagicas_Bruxos1`
    FOREIGN KEY (`Bruxos_idBruxos`)
    REFERENCES `Bruxos` (`idBruxos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bruxos_has_CriaturasMagicas_CriaturasMagicas1`
    FOREIGN KEY (`CriaturasMagicas_idCriatura`)
    REFERENCES `CriaturasMagicas` (`idCriatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
