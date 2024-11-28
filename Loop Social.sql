create database loopsocial;
use loopsocial;

CREATE TABLE USUARIO (
id_usuario int auto_increment,
email varchar(50) NOT NULL,
nome varchar(50) NOT NULL,
sobrenome varchar(50) NOT NULL,
senha varchar(50) NOT NULL,
resumo varchar(200) NOT NULL,
seguidores int NOT NULL,
seguindo int NOT NULL,
aceiteTermo boolean NOT NULL,
primary key (id_usuario),
UNIQUE (email)
);

create table postagem (
id_postagem int auto_increment,
conteudo varchar(1000) not null,
titulo varchar(100) not null,
dataPostagem datetime not null,
curtida int not null,
id_usuario int not null,
primary key (id_postagem),
CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

