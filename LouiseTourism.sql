CREATE DATABASE louisetourism;
USE louisetourism;

CREATE TABLE destino (
 id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 nome VARCHAR(120),
 pais VARCHAR(100),
 descricao VARCHAR(300)
 );
 
 CREATE TABLE pacote (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_destino INT,
  nome VARCHAR(120),
  preco DOUBLE,
  datainicio DATE,
  datatermino DATE,
  
 FOREIGN KEY (id_destino) REFERENCES destino(id)
 );
 
 CREATE TABLE cliente(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(200),
  email VARCHAR(200),
  telefone VARCHAR(15),
  endereco VARCHAR(200)
 );
 
 CREATE TABLE reserva(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_cliente INT,
  id_pacote INT,
  datareserva DATE,
  pessoas INT,
  statusreserva ENUM('Confirmada', 'Pendente', 'Cancelada'),
   FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_pacote) REFERENCES pacote(id)
 );
 
 
 INSERT INTO destino (nome,pais,descricao) VALUES
 
  ('Londres','Inglaterra', 'Imersão no velho mundo, mergulhe na história da capital britânica'),
  ('Veneza','Itália', 'Viaje para a cidade da Renascença e do romance'),
  ('Tóquio','Japão', ' Destino para amantes de Tecnologia'),
  ('Califórnia','EUA', 'Conheça Hollywood e San Francisco'),
  ('Seul','Coréia do Sul', 'Imersão na cultura e história coreana'),
  ('Nova Iorque','EUA', 'Viaje para a maior metrópole do mundo');
  
  INSERT INTO cliente (nome,email,telefone,endereco) VALUES
  
  ('Isabella', 'isa@email.com', '1234567','Rua Nasa, 159'),
  ('João', 'joao2@email.com', '5678910','Rua Brasil, 132'),
  ('Marcos', 'marcos@email.com', '1472589','Rua Lavanda, 605'),
  ('Débora', 'debora@email.com', '3692587','Avenida Paulista, 312'),
  ('Carlos', 'carlos@email.com', '2589631','Avenida Faria Lima, 214'),
  ('Samira', 'sami@email.com', '1326458','Rua Limoeiro, 913'),
  ('José', 'jose@email.com', '9658741','Rua Júpiter, 13'),
  ('Maria', 'maria@email.com', '7412586','Rua Saturno, 44'),
  ('Otávio', 'otavio@email.com', '9658741','Rua das Bandeiras, 751');
  
  INSERT INTO pacote (id_destino,nome, preco, datainicio, datatermino) VALUES
   (1 , 'Terras britânicas', 80000.00 '2025-10-09', '2025-11-10'),
   (2 , 'Europa Renascentista', 90000.00, '2025-08-12', '2025-09-12'),
   (3 , 'Ásia Tecnológica', 85000.00,'2025-08-12', '2025-09-04'),
   (4 , 'Um pouco de Hollywood', 96000.00, '2025-07-10', '2025-08-10'),
   (5 , 'História coreana', 60000.00, '2025-07-11', '2025-08-12'),
   (6 , 'New York: A cidade que nunca dorme', 98000.00, '2025-08-11', '2025-09-12');
   
INSERT INTO reserva (id_cliente, id_pacote, datareserva, pessoas, statusreserva) VALUES
 (1,5, '2025-06-04',250, 'Confirmada'),
 (9,4,'2025-06-02',250, 'Pendente'),
 (3,1,'2025-08-05' ,230, 'Cancelada'),
 (5,2, '2025-08-01',240, 'Cancelada'),
 (2,6,'2025-06-05', 220, 'Pendente')
 (4,3,'2025-07-15',220, 'Confirmada'),
 (6,3,'2025-07-02' ,260, 'Confirmada'),
 (8,5,'2025-01-15',250, 'Pendente'),
 (7,1,'2025-08-10',230, 'Cancelada');

-- View Pacote -> Destino
SELECT id_destino, destino.nome FROM pacote
INNER JOIN destino ON pacote.id_destino= destino.id;

CREATE VIEW visualizar_pacotes_destinos AS
SELECT id_destino, destino.nome FROM pacote
INNER JOIN destino ON pacote.id_destino = destino.id;

SELECT * FROM visualizar_pacotes_destinos;


-- View Reserva -> Cliente
SELECT cliente.nome AS nomeCliente,reserva.datareserva AS DataReserva, reserva.pessoas AS quantidadePessoas, reserva.statusreserva AS statusReserva
FROM  reserva 
INNER JOIN cliente  ON reserva.id_cliente = cliente.id;

CREATE VIEW visualizar_reservas_clientes AS
SELECT  cliente.nome AS nomeCliente,reserva.datareserva AS DataReserva, reserva.pessoas AS quantidadePessoas, reserva.statusreserva AS statusReserva
FROM  reserva 
INNER JOIN cliente  ON reserva.id_cliente = cliente.id;

SELECT * FROM visualizar_reservas_clientes;

-- View Pacote -> Reserva

SELECT pacote.nome AS nomePacote, reserva.datareserva AS dataReserva, reserva.statusreserva AS statusReserva
FROM pacote 
INNER JOIN  reserva ON pacote.id = reserva.id_pacote;

CREATE VIEW visualizar_pacotes_reservas AS
SELECT pacote.nome AS nomePacote, reserva.datareserva AS dataReserva, reserva.statusreserva AS statusReserva
FROM pacote 
INNER JOIN  reserva ON pacote.id = reserva.id_pacote;
   

SELECT * FROM visualizar_pacotes_reservas;

-- View Cliente -> Pacote -> Reserva

SELECT cliente.nome AS nomeCliente, pacote.nome AS nomePacote, reserva.datareserva
FROM  reserva 
INNER JOIN  cliente ON reserva.id_cliente = cliente.id
INNER JOIN pacote ON reserva.id_pacote = pacote.id;

CREATE VIEW visualizar_clientes_pacotes_reservados AS
SELECT cliente.nome AS nomeCliente, pacote.nome AS nomePacote, reserva.datareserva
FROM  reserva 
INNER JOIN  cliente ON reserva.id_cliente = cliente.id
INNER JOIN pacote ON reserva.id_pacote = pacote.id;

SELECT * FROM visualizar_clientes_pacotes_reservados;
