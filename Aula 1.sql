CREATE TABLE produtos(
	id TEXT PRIMARY key not NULL,
  	nome varchar(255),
  	descricao varchar(255),
  	preco decimal(10,2),
	categoria varchar(50)
);

CREATE table colaboradores(
	ID TEXT PRIMARY KEY,
  	Nome varchar NOT NULL,
  	Cargo varchar(100),
  	DataContratacao date,
  	Telefone varchar(50),
  	Email varchar(50),
	Rua  varchar(100) NOT NULL,
  	Bairro varchar(100) NOT NULL,
  	Cidade varchar(100) NOT NULL,
  	Estado varchar(2) NOt NULL,
  	cep varchar(8) NOT NULL
);

CREATE TABLE fornecedores(
	ID TEXT PRIMARY KEY,
  	Nome varchar(255),
  	Contato varchar NOT NULL,
  	Telefone varchar(50),
  	Email varchar(50),
	Rua  varchar(100) NOT NULL,
  	Bairro varchar(100) NOT NULL,
  	Cidade varchar(100) NOT NULL,
  	Estado varchar(2) NOt NULL,
  	cep varchar(8) NOT NULL
);

CREATE TABLE pedidos(
	id text PRIMARY key NOT NULL,
  	idcliente text,
  	datahorapedido date,
  	status varchar(50),
  	FOREIGN key (idcliente) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE clientes(
	id text PRIMARY key NOT NULL,
  	nome varchar(255),
  	telefone varchar(20),
  	email varchar(100) DEFAULT 'Sem email',
  	endereco varchar(255)
);

CREATE TABLE itenspedidos(
	idpedido TEXT,
  	idproduto TEXT,
  	quantidade INT,
  	precounitario DECIMAL(10,2),
  	PRIMARY key (idpedido, idproduto),
  	FOREIGN key (idpedido) REFERENCES pedidos(id) ON DELETE CASCADE,
  	FOREIGN key (idproduto) REFERENCES produtos(id) ON DELETE CASCADE
);

drop table demo;