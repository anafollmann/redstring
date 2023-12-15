CREATE DATABASE redstring;
USE redstring;

CREATE TABLE Usuario(
id_usuario BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
username VARCHAR(15) UNIQUE NOT NULL,
email VARCHAR(200) NOT NULL UNIQUE,
senha VARCHAR(20) NOT NULL,
PRIMARY KEY (id_usuario)
);

CREATE TABLE Historia(
id_hist BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
titulo_hist VARCHAR(50) NOT NULL, 
data_hist DATE NOT NULL, 
desc_hist TEXT,
id_usuario BIGINT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
PRIMARY KEY (id_hist)
);

CREATE TABLE Localizacao(
id_local BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
titulo_local VARCHAR(35) NOT NULL,
desc_local TEXT,
id_usuario BIGINT NOT NULL,
id_hist BIGINT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_hist) REFERENCES historia(id_hist) ON DELETE SET NULL
);

CREATE TABLE Personagem( 
id_perso BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
nome_perso VARCHAR(40),
desc_perso TEXT,
aparencia_perso TEXT,
id_usuario BIGINT NOT NULL,
id_hist BIGINT,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_hist) REFERENCES Historia(id_hist) ON DELETE SET NULL,
PRIMARY KEY (id_perso)
);

CREATE TABLE Local_persona (
id_local_persona BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
id_local BIGINT,
id_perso BIGINT,
FOREIGN KEY (id_local) REFERENCES Localizacao(id_local) ON DELETE SET NULL,
FOREIGN KEY (id_perso) REFERENCES Personagem(id_perso) ON DELETE SET NULL
);

CREATE TABLE Perso_perso(
id_perso_perso BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
rel_titulo VARCHAR(30) NOT NULL,
id_perso BIGINT,
id_perso2 BIGINT,
FOREIGN KEY (id_perso) REFERENCES Personagem(id_perso) ON DELETE SET NULL,
FOREIGN KEY (id_perso2) REFERENCES Personagem(id_perso) ON DELETE SET NULL,
PRIMARY KEY (id_perso_perso)
);

CREATE TABLE Anotação(
id_nota BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
titulo_nota VARCHAR(30) NOT NULL,
conteudo MEDIUMTEXT NOT NULL,
data_nota DATE NOT NULL,
id_usuario BIGINT NOT NULL,
id_hist BIGINT,
id_local BIGINT,
id_perso BIGINT,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_hist) REFERENCES Historia(id_hist) ON DELETE SET NULL,
FOREIGN KEY (id_local) REFERENCES Localizacao(id_local) ON DELETE SET NULL,
FOREIGN KEY (id_perso) REFERENCES Personagem(id_perso) ON DELETE SET NULL,
PRIMARY KEY(id_nota)
);