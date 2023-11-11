CREATE DATABASE locadora;
USE locadora;

CREATE TABLE IF NOT EXISTS cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    Endereco VARCHAR(45)
);
SELECT * FROM cliente;

CREATE TABLE IF NOT EXISTS clienteID(
    PClienteID INT PRIMARY KEY AUTO_INCREMENT,
    telefone BIGINT,
    email VARCHAR(45),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);
SELECT * FROM clienteID;

CREATE TABLE IF NOT EXISTS funcionario(
    IDFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    observacao VARCHAR(45)
);
SELECT * FROM funcionario;

CREATE TABLE IF NOT EXISTS funcionarioID(
    PFuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
    telefone BIGINT,
    email VARCHAR(45),
    IDFuncionario INT,
    FOREIGN KEY (IDFuncionario) REFERENCES funcionario(IDFuncionario)
);
SELECT * FROM funcionarioID;

CREATE TABLE IF NOT EXISTS aluguel(
    IDAluguel INT PRIMARY KEY AUTO_INCREMENT,
    IDCliente INT,
    IDFuncionario INT,
    IDFilme INT,
    data_locacao DATETIME,
    data_vencimento DATETIME,
    FOREIGN KEY (IDCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (IDFuncionario) REFERENCES funcionario(IDFuncionario),
    FOREIGN KEY (IDFilme) REFERENCES filme(IDFilme)
);
SELECT * FROM aluguel;

CREATE TABLE IF NOT EXISTS filme(
    IDFilme INT PRIMARY KEY AUTO_INCREMENT,
    data_lancamento DATETIME,
    nome VARCHAR(45),
    class_indicativa INT,
    disponibilidade INT,
    PGeneroID INT,
    FOREIGN KEY (PGeneroID) REFERENCES genero(PGeneroID)
);
SELECT * FROM filme;

CREATE TABLE IF NOT EXISTS genero(
    PGeneroID INT PRIMARY KEY AUTO_INCREMENT,
    Genero VARCHAR(20)
);
SELECT * FROM genero;

SHOW TABLES;

/*---------------------------------------[INSERTS]---------------------------------------------------*/

INSERT INTO cliente(IDCliente, nome, Endereco) VALUES  
(23, 'João Silva', 'Rua A, 123'),(44, 'Maria Santos', 'Avenida B, 456'),  
(22, 'Pedro Oliveira', 'Rua C, 789'),  (33, 'Ana Pereira', 'Avenida D, 987'),  (55, 'Carlos Mendes', 'Rua E, 654'); 
SELECT * FROM cliente;

INSERT INTO clienteID(PClienteID, telefone, email, idCliente) VALUES 
(1, 7177777777, 'email@generico.com', 23), 
(2, 7133335555, 'email@generico2.com', 44), 
(3, 7144448888, 'email@generico3.com', 22), 
(4, 7199996666, 'email@generico4.com', 33), 
(5, 7111112222, 'email@generico5.com', 55);
SELECT * FROM clienteID;

INSERT INTO funcionario (IDFuncionario, nome, observacao) VALUES 
(1, 'Luis Vinicius', 'não trabalhou de forma adequada'),
(2, 'Gabriel Chagas', 'Proximo a ser promovido'),
(3, 'Ronaldo', 'Excelente funcionario'),
(4, 'Messi', 'Muitas faltas'),
(5, 'Portugal', 'Não compareceu na reunião');
SELECT * FROM funcionario;

INSERT INTO funcionarioID(PFuncionarioID, telefone, email, IDFuncionario) VALUES 
(1, 7177713414, 'email@generico.com', 1),
(2, 7133335555, 'email@generico2.com', 2),
(3, 7144448888, 'email@generico3.com', 3),
(4, 7199996666, 'email@generico4.com', 4),
(5, 7111112222, 'email@generico5.com', 5);
SELECT * FROM funcionarioID;

INSERT INTO filme (IDFilme, data_lancamento, nome, class_indicativa, disponibilidade, PGeneroID) VALUES 
(100, '1999-01-01', 'Star Wars: Episódio 1', 12, 100, 100),
(101, '2002-01-01', 'Star Wars: Episódio 2', 12, 100, 101),
(102, '1977-01-01', 'Star Wars: Episódio 3', 12, 100, 102),
(103, '1980-01-01', 'Star Wars: Episódio 4', 12, 100, 103),
(104, '1983-01-01', 'Star Wars: Episódio 5', 12, 100, 104);
SELECT * FROM filme;

INSERT INTO genero(PGeneroID, Genero) VALUES 
(100, 'acao'),
(101, 'epico'),
(102, 'ficcao cientifica'),
(103, 'aventura'),
(104, 'SCI-FI');
SELECT * FROM genero;

INSERT INTO aluguel (IDCliente, IDFuncionario, IDFilme, data_locacao, data_vencimento) VALUES
(23, 1, 100, '2023-05-30 00:00:00', '2023-06-07 00:00:00'),
(23, 1, 104, '2023-05-30 00:00:00', '2023-06-07 00:00:00'),
(23, 1, 102, '2023-05-30 00:00:00', '2023-06-07 00:00:00'),
(23, 1, 101, '2023-05-30 00:00:00', '2023-06-07 00:00:00');
SELECT * FROM aluguel;