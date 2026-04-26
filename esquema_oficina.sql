-- Criação do Banco de Dados para Oficina
CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Telefone VARCHAR(15)
);

CREATE TABLE Veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    Placa CHAR(7) UNIQUE NOT NULL,
    Modelo VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Ordens_Servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT,
    Data_Emissao DATE NOT NULL,
    Valor_Total DECIMAL(10,2),
    Status ENUM('Aberto', 'Em Execução', 'Concluido', 'Cancelado') DEFAULT 'Aberto',
    FOREIGN KEY (idVeiculo) REFERENCES Veiculos(idVeiculo)
);
