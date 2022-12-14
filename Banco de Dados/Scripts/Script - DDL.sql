CREATE DATABASE GUFI;
GO

USE GUFI;
GO

CREATE TABLE tipoUsuario (
	IdTipoUsuario TINYINT PRIMARY KEY IDENTITY (1,1),
	tituloTipoUsuario VARCHAR(100)
);
GO

CREATE TABLE tipoEvento (
	IdTipoEvento INT PRIMARY KEY IDENTITY (1,1),
	tituloTipoEvento VARCHAR(100) UNIQUE NOT NULL
);
GO

CREATE TABLE instituicao (
	IdInstituicao SMALLINT PRIMARY KEY IDENTITY (1,1),
	CNPJ CHAR(18) UNIQUE NOT NULL, 
	nomeFantasia VARCHAR (100) NOT NULL,
	endereco VARCHAR(200) UNIQUE NOT NULL
);
GO


CREATE TABLE situacao (
	IdSituacao TINYINT PRIMARY KEY IDENTITY (1,1),
	descricao VARCHAR(30) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY IDENTITY (1,1),
	IdTipoUsuario TINYINT FOREIGN KEY REFERENCES tipoUsuario(IdTipoUsuario),
	nomeUsuario VARCHAR (100) NOT  NULL,
	email VARCHAR (256) UNIQUE NOT NULL,
	senha VARCHAR(16) NOT NULL CHECK(len(senha)>= 8),
);
GO

CREATE TABLE Evento (
	IdEvento INT PRIMARY KEY IDENTITY (1,1),
	IdTipoEvento INT FOREIGN KEY REFERENCES tipoEvento(IdTipoEvento),
	IdInstituicao SMALLINT FOREIGN KEY REFERENCES Instituicao (IdInstituicao),
	nomeEvento VARCHAR (100) NOT  NULL,
	descricaoEvento VARCHAR(500) NOT NULL,
	dataEvento DATETIME NOT NULL,
	acessoLivre BIT  DEFAULT (1),
	
);

CREATE TABLE presenca (
	IdPresenca INT PRIMARY KEY IDENTITY (1,1),
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
	IdSituacao TINYINT FOREIGN KEY REFERENCES Situacao(IdSituacao),
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento),
);
GO