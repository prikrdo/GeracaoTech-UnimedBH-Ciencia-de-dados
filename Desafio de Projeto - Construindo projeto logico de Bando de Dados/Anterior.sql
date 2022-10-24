-- criação do banco de dados para o cenário de E-comerce
-- drop database ecomerce;
create database ecomerce;
use ecomerce;
-- criar tabela cliente

create table cliente(
	idCliente int auto_increment primary key,
	Fname varchar (10),
	Minit char (3),
	Lname varchar (20),
	CPF char (11) not null,
	Endereco varchar (30),
	constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment = 1;

desc cliente;

-- criar tabela produto
-- tamanho = dimensão do protudo
create table produto(
	idProduto int auto_increment primary key,
	Pname varchar (10) not null,
	Classificacao_Kids bool default false,
	Categoria enum ('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
	Avaliacao float default 0,
	Tamanho varchar (10)
);

alter table produto auto_increment = 1;

desc produto;
-- criar tabela pagamento
-- para ser continuado no desafio: terminar de implementar a tabela e criar a conexao com as tabelas necessárias 
-- alem disso, reflita essa modificacao no diagrama de esquema relacional
-- criar constraint relacionadas ao pagamento
-- create table pagamento(
-- 	idCliente int,
-- 	idPagamento int,
-- 	TipoPagamento enum('Dinheiro','Boleto','Cartão','Dois Cartões'),
-- 	limite float,
-- 	primary key(idCliente, idPagamento)
-- );

-- criar tabela pedido

create table pedido(
	idPedido int auto_increment primary key,
	idCliente int,
	Status enum ('Cancelado','Confirmado','Em processamento') default 'Em Processamento',
	Descricao varchar (255),
	Frete float default 10,
	PgDinheiro bool default false,
	-- idPagamento, 
	constraint fk_pedido_cliente foreign key (idCliente) references cliente(idCliente)
			on update cascade
);

alter table pedido auto_increment = 1;

desc pedido;

-- criar tabela estoque

create table estoque(
	idEstoque int auto_increment primary key,
	local varchar (255) not null,
	quantidade int default 0 
);

alter table estoque auto_increment = 1;

-- criar tabela fornecedor

create table fornecedor(
	idFornecedor int auto_increment primary key,
	razaoSocial varchar (255) not null,
	CNPJ char (15) not null,
	contato char (11) not null,
	constraint unico_CNPJ_fornecedor unique (CNPJ)
);

alter table fornecedor auto_increment = 1;

desc fornecedor;

-- criar tabela Vendedor

create table Vendedor(
	idVendedor int auto_increment primary key,
	razaoSocial varchar (255) not null,
	nomeFantasia varchar (255),
	CNPJ char (15),
	CPF char (9),
	local varchar (255),
    contato char (11) not null, 
	constraint unico_CNPJ_vendedor unique (CNPJ),
	constraint unico_CPF_vendedor unique (CPF)
);

alter table vendedor auto_increment = 1;

-- criar produtosVendedor

create table produtosVendedor(
	idVendedor int, 
	idProduto int,
	quantidade int not null default 1,
	primary key (idVendedor, idProduto),
	constraint fk_produtos_vendedor foreign key (idVendedor) references vendedor(idVendedor),
	constraint fk_produtos_produto foreign key (idProduto) references produto(idProduto)
);

desc produtosVendedor;

-- criar tabela produtosPedido

create table produtosPedido(
	idProduto int,
	idPedido int,
	quantidade int default 1,
	status enum('Disponivel','Sem Estoque') default 'Disponivel',
	primary key (idProduto, idPedido),
	constraint fk_prodped_produto foreign key (idProduto) references produto (idProduto),
	constraint fk_prodped_pedido foreign key (idPedido) references pedido (idPedido)
);

desc produtosPedido;

-- criar tabela local estoque

create table localEstoque(
	idProduto int,
	idEstoque int,
	local varchar (255) not null,
	primary key (idProduto, idEstoque),
	constraint fk_locestoque_produto foreign key (idProduto) references produto (idProduto),
	constraint fk_locaestoque_estoque foreign key (idEstoque) references estoque (idEstoque)
);

desc localEstoque;

-- criar tabela produtoFornecedor
create table produtoFornecedor(
	idFornecedor int,
	idProduto int,
	quantidade int not null,
	primary key (idFornecedor, idProduto),
	constraint fk_prodfornecedor_fornecedor foreign key (idFornecedor) references fornecedor (idFornecedor),
	constraint fk_prodfornecedor_produto foreign key (idProduto) references produto (idProduto)
);

desc produtoFornecedor;
show tables ;

show databases;

use information_schema;
show tables;

desc REFERENTIAL_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS
where constraint_schema = 'ecomerce';

