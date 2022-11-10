-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalho_banco` ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `trabalho_banco` ;

-- -----------------------------------------------------
-- Table `trabalho_banco`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`usuario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `primeiro_nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `data_nasci` DATE NOT NULL,
  `cidade` VARCHAR(15) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`aluno` (
  `mat_aluno` VARCHAR(8) NOT NULL,
  `usuario_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`mat_aluno`),
  INDEX `fk_aluno_usuario1_idx` (`usuario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_usuario1`
    FOREIGN KEY (`usuario_cpf`)
    REFERENCES `trabalho_banco`.`usuario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`professor` (
  `mat_professor` VARCHAR(8) NOT NULL,
  `usuario_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`mat_professor`),
  INDEX `fk_professor_usuario1_idx` (`usuario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_professor_usuario1`
    FOREIGN KEY (`usuario_cpf`)
    REFERENCES `trabalho_banco`.`usuario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`instrumentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`instrumentos` (
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nome`, `tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`toca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`toca` (
  `nivel` INT NOT NULL,
  `instrumentos_nome` VARCHAR(45) NOT NULL,
  `instrumentos_tipo` VARCHAR(45) NOT NULL,
  `aluno_mat_aluno` VARCHAR(8) NOT NULL,
  INDEX `fk_toca_instrumentos1_idx` (`instrumentos_nome` ASC, `instrumentos_tipo` ASC) VISIBLE,
  INDEX `fk_toca_aluno1_idx` (`aluno_mat_aluno` ASC) VISIBLE,
  CONSTRAINT `fk_toca_instrumentos1`
    FOREIGN KEY (`instrumentos_nome` , `instrumentos_tipo`)
    REFERENCES `trabalho_banco`.`instrumentos` (`nome` , `tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_toca_aluno1`
    FOREIGN KEY (`aluno_mat_aluno`)
    REFERENCES `trabalho_banco`.`aluno` (`mat_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`modulo` (
  `cod_modulo` VARCHAR(5) NOT NULL,
  `descricao` MEDIUMTEXT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`cod_modulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`leciona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`leciona` (
  `instrumentos_nome` VARCHAR(45) NOT NULL,
  `instrumentos_tipo` VARCHAR(45) NOT NULL,
  `modulo_cod_modulo` VARCHAR(5), /*NOT NULL,*/
  `professor_mat_professor` VARCHAR(8) NOT NULL,
  INDEX `fk_leciona_instrumentos1_idx` (`instrumentos_nome` ASC, `instrumentos_tipo` ASC) VISIBLE,
  INDEX `fk_leciona_modulo1_idx` (`modulo_cod_modulo` ASC) VISIBLE,
  INDEX `fk_leciona_professor1_idx` (`professor_mat_professor` ASC) VISIBLE,
  CONSTRAINT `fk_leciona_instrumentos1`
    FOREIGN KEY (`instrumentos_nome` , `instrumentos_tipo`)
    REFERENCES `trabalho_banco`.`instrumentos` (`nome` , `tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_leciona_modulo1`
    FOREIGN KEY (`modulo_cod_modulo`)
    REFERENCES `trabalho_banco`.`modulo` (`cod_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_leciona_professor1`
    FOREIGN KEY (`professor_mat_professor`)
    REFERENCES `trabalho_banco`.`professor` (`mat_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`pagamento` (
  `id_compra` VARCHAR(45) NOT NULL,
  `flag` TINYINT(1) NOT NULL,
  `aluno_mat_aluno` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_pagamento_aluno1_idx` (`aluno_mat_aluno` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_aluno1`
    FOREIGN KEY (`aluno_mat_aluno`)
    REFERENCES `trabalho_banco`.`aluno` (`mat_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`cursa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`cursa` (
  `cursa_cod_modulo` VARCHAR(5) NOT NULL,
  `pagamento_id_compra` VARCHAR(45) NOT NULL,
  INDEX `fk_cursa_cursa1_idx` (`cursa_cod_modulo` ASC) VISIBLE,
  INDEX `fk_cursa_pagamento1_idx` (`pagamento_id_compra` ASC) VISIBLE,
  CONSTRAINT `fk_cursa_cursa1`
    FOREIGN KEY (`cursa_cod_modulo`)
    REFERENCES `trabalho_banco`.`modulo` (`cod_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursa_pagamento1`
    FOREIGN KEY (`pagamento_id_compra`)
    REFERENCES `trabalho_banco`.`pagamento` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`tecnico` (
  `nivel` INT NOT NULL,
  `video` BLOB NOT NULL,
  `parti_tabla` BLOB NOT NULL,
  `modulo_cod_modulo` VARCHAR(5) NOT NULL,
  INDEX `fk_tecnico_modulo1_idx` (`modulo_cod_modulo` ASC) VISIBLE,
  CONSTRAINT `fk_tecnico_modulo1`
    FOREIGN KEY (`modulo_cod_modulo`)
    REFERENCES `trabalho_banco`.`modulo` (`cod_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`modulos_adqu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`modulos_adqu` (
  `nome_modulo` VARCHAR(45) NOT NULL,
  `data_compra` DATE NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  `pagamento_id_compra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pagamento_id_compra`),
  CONSTRAINT `fk_modulos_adqu_pagamento1`
    FOREIGN KEY (`pagamento_id_compra`)
    REFERENCES `trabalho_banco`.`pagamento` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_banco`.`teorico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_banco`.`teorico` (
  `horas` INT NOT NULL,
  `video` BLOB NOT NULL,
  `arquivos` BLOB NOT NULL,
  `modulo_cod_modulo` VARCHAR(5) NOT NULL,
  CONSTRAINT `fk_teorico_modulo1`
    FOREIGN KEY (`modulo_cod_modulo`)
    REFERENCES `trabalho_banco`.`modulo` (`cod_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO usuario (cpf, nome_usuario, senha, primeiro_nome, sobrenome, email, data_nasci,
cidade, uf) VALUES ('00000000001', 'user01', 'senha01', 'usuario', '01', 'email01@gmail.com', '2000/01/04', 'Calango', 'SE');
INSERT INTO usuario (cpf, nome_usuario, senha, primeiro_nome, sobrenome, email, data_nasci,
cidade, uf) VALUES ('00000000002', 'user02', 'senha02', 'usuario', '02', 'email02@gmail.com', '2000/01/05', 'Calango', 'SE');
INSERT INTO usuario (cpf, nome_usuario, senha, primeiro_nome, sobrenome, email, data_nasci,
cidade, uf) VALUES ('00000000003', 'user03', 'senha02', 'usuario', '03', 'email03@gmail.com', '2000/01/06', 'Calango', 'SE');

INSERT INTO aluno (mat_aluno, usuario_cpf) VALUES ('20220001','00000000001');
INSERT INTO aluno (mat_aluno, usuario_cpf) VALUES ('20220002', '00000000002');
INSERT INTO professor (mat_professor, usuario_cpf) VALUES ('20220003', '00000000003');

INSERT INTO instrumentos (nome, tipo) VALUES ('violão', 'cordas');
INSERT INTO instrumentos (nome, tipo) VALUES ('contrabaixo', 'codas');
INSERT INTO instrumentos (nome, tipo) VALUES ('bateria', 'percussão');
INSERT INTO instrumentos (nome, tipo) VALUES ('apito', 'sopro');

INSERT INTO toca (nivel, instrumentos_nome, instrumentos_tipo, aluno_mat_aluno) VALUES (1, 'violão', 'cordas', '20220001');
INSERT INTO toca (nivel, instrumentos_nome, instrumentos_tipo, aluno_mat_aluno) VALUES (1, 'apito', 'sopro', '20220002');

INSERT INTO modulo (cod_modulo, descricao, nome, preco) VALUES ('00001', 'primeiro modulo que serve de teste para o paranaue', 'como assoprar no apito', 1500.00);

INSERT INTO modulo (cod_modulo, descricao, nome, preco) VALUES ('00002', 'segurar o vilão pela primeira vez pode ser um pouco dificil!', 'como SEGURAR um violão', 2999.99);

INSERT INTO leciona (instrumentos_nome, instrumentos_tipo, modulo_cod_modulo, professor_mat_professor) VALUES ('apito', 'sopro', NULL ,'20220003');
INSERT INTO leciona (instrumentos_nome, instrumentos_tipo, modulo_cod_modulo, professor_mat_professor) VALUES ('apito', 'sopro', '00001' ,'20220003');
INSERT INTO leciona (instrumentos_nome, instrumentos_tipo, modulo_cod_modulo, professor_mat_professor) VALUES ('violão', 'cordas', '00002' ,'20220003');