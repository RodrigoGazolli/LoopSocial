# LoopSocial
## Rede Social Voltada Para Estudantes


Desenvolver uma plataforma de rede social chamada LoopSocial, com funcionalidades básicas de interação entre usuários, como publicações e perfil de usuário. O projeto será desenvolvido utilizando a linguagem Java para a lógica do sistema, MySQL para o banco de dados e Bootstrap para a interface gráfica.

A aplicação foi construída utilizando as tecnologias:

- **Java** (para o back-end).
- **MySQL** (para o banco de dados).
- **BootStrap** (para o front-end).
- **NetBeans** como IDE 



### 1. Objetivo Geral
Criar uma rede social simples, intuitiva, funcional e responsiva, permitindo que
usuários interajam entre si através de postagens.

### 2. Funcionalidades Principais:
Permite adicionar novos produtos ao estoque com informações detalhadas, como nome, descrição, preço, quantidade, categoria e fornecedor.

- **Cadastro de Usuário**: Os usuários poderão criar contas, informando dados como nome, email e senha.
- **Login e Autenticação**: O sistema permitirá login com email e senha previamente cadastrados.
- **Perfil de Usuário**: Cada usuário terá um perfil com informações pessoais.
-  **Publicação de Postagens**: Os usuários poderão criar postagens de texto, com a possibilidade de visualizar suas próprias postagens e de outros usuários.


### 3. Metodologia de Desenvolvimento:
O trabalho foi estruturado utilizando os padrões de design **DAO** (Data Access Object) e **MVC** (Model-View-Controller) para garantir uma organização e separação claras das responsabilidades no sistema.

### 4. Resultados Esperados:
- Rede social funcional com as principais funcionalidades de interação.
- Interface amigável e responsiva que se adapta a diferentes dispositivos.

## 5. Responsabilidades da Equipe:

- **Desenvolvedor 1** (André): Foco no desenvolvimento do backend (**Java**), lógica de autenticação, banco de dados (**MySQL**).
- **Desenvolvedor 2** (Rodrigo): Foco na interface (**Bootstrap**), integração frontend e backend e ajustes na parte visual.

## 6. Possíveis Desafios:
- Integração entre o frontend e o backend.
- Garantir a segurança nas trocas de dados (autenticação e autorização)

## 7. Diagrama de Classe: 
![Diagrama de Classe](https://github.com/RodrigoGazolli/LoopSocial/raw/main/diagrama.png)


## 8. Código SQL


```sql
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


```



