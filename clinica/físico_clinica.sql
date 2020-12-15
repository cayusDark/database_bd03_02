/* Lógico_clinica: */

CREATE TABLE medicos (
    id int AUTO_INCREMENT PRIMARY KEY,
    crm varchar(10),
    nome varchar(60),
    salario double(8,2),
    fk_especialidade_id int
);

CREATE TABLE pacientes (
    id int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(60),
    rg varchar(10),
    cpf varchar(11),
    dataNascimento date,
    horario time,
    fk_medicos_id int,
    fk_quartos_id int
);

CREATE TABLE especialidade (
    id int AUTO_INCREMENT PRIMARY KEY,
    formacao varchar(60)
);

CREATE TABLE telefones (
    id int AUTO_INCREMENT PRIMARY KEY,
    numero varchar(11)
);

CREATE TABLE enderecos (
    id int AUTO_INCREMENT PRIMARY KEY,
    logradouro varchar(60),
    numero varchar(10),
    bairro varchar(20),
    complemento varchar(60)
);

CREATE TABLE trata (
    id int AUTO_INCREMENT PRIMARY KEY,
    fk_medicos_id int,
    fk_pacientes_quartos_id int
);

CREATE TABLE possui (
    id int AUTO_INCREMENT PRIMARY KEY,
    fk_pacientes_quartos_id int,
    fk_telefones_id int
);

CREATE TABLE reside (
    id int AUTO_INCREMENT PRIMARY KEY,
    fk_pacientes_quartos_id int,
    fk_enderecos_id int
);

CREATE TABLE quartos (
    id int AUTO_INCREMENT PRIMARY KEY,
    numero int,
    andar int
);
 
ALTER TABLE medicos ADD CONSTRAINT FK_medicos_2
    FOREIGN KEY (fk_especialidade_id)
    REFERENCES especialidade (id)
    ON DELETE RESTRICT;
 
ALTER TABLE pacientes ADD CONSTRAINT FK_pacientes_2
    FOREIGN KEY (fk_medicos_id)
    REFERENCES medicos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE pacientes ADD CONSTRAINT FK_pacientes_3
    FOREIGN KEY (fk_quartos_id)
    REFERENCES quartos (id);
 
ALTER TABLE trata ADD CONSTRAINT FK_trata_1
    FOREIGN KEY (fk_medicos_id)
    REFERENCES medicos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE trata ADD CONSTRAINT FK_trata_2
    FOREIGN KEY (fk_pacientes_quartos_id)
    REFERENCES pacientes (id)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_pacientes_quartos_id)
    REFERENCES pacientes (id)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_telefones_id)
    REFERENCES telefones (id)
    ON DELETE RESTRICT;
 
ALTER TABLE reside ADD CONSTRAINT FK_reside_1
    FOREIGN KEY (fk_pacientes_quartos_id)
    REFERENCES pacientes (id)
    ON DELETE SET NULL;
 
ALTER TABLE reside ADD CONSTRAINT FK_reside_2
    FOREIGN KEY (fk_enderecos_id)
    REFERENCES enderecos (id)
    ON DELETE SET NULL;