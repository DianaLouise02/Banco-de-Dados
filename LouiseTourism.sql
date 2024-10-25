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
   (1 , 'Terras britânicas', 80.000, "2025/10/09",  "2025/11/10"),
   (2 , 'Europa Renascentista', 90.000, "2025/08/12", "2025/09/12"),
   (3 , 'Ásia Tecnológica', 85.000, "2025/08/12",  "2025/09/04"),
   (4 , 'Um pouco de Hollywood', 96.000, "2025/07/10",  "2025/08/10"),
   (5 , 'História coreana', 60.000, "2025/07/11",  "2025/08/12"),
   (6 , 'New York: A cidade que nunca dorme', 98.000, "2025/08/11", "2025/09/12");
   
INSERT INTO reserva (id_cliente, id_pacote, datareserva, pessoas, statusreserva) VALUES
 (1,5, "2025/06/04",250, 'confirmada'),
 (9,4, "2025/06/02",250, 'pendente'),
 (3,1, "2025/08/05",230, 'cancelada'),
 (5,2, "2025/08/01",240, 'cancelada'),
 (2,6, "2025/06/05",220, 'pendente'),
 (4,3, "2025/15/07",220, 'confirmada'),
 (6,3, "2025/07/02" ,260, 'confirmada'),
 (8,5, "2025/15/01",250, 'pendente'),
 (7,1, "2025/10/08",230, 'cancelada');