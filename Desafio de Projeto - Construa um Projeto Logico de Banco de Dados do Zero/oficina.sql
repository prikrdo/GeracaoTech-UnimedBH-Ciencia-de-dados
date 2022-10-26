
-- drop database oficina;
create database if not exists oficina;

use oficina;

-- criar tabela cliente

create table cliente(
	idCliente int auto_increment primary key,
    codigo int not null,
    constraint unico_codigo_cliente unique (codigo)
);

desc cliente;

-- criar tabela cadPf

create table cadPF(
	idCadpf int auto_increment,
    idCliente int,
    CPF char (11) not null,
    nomeCompleto varchar (45) not null,
    rua varchar (100),
    numero int,
    bairro varchar (20),
    cidade varchar (50),
    cep char (8),
    complemento varchar (20),
    datanascimento date,
    telefone1 char (11) not null,
    telefone2 char (11),
    email varchar (100),
    primary key (idCadPF, idCLiente),
    constraint unico_cpf_cliente unique (cpf),
    constraint fk_idcliente_cadpf foreign key (idCliente) references cliente(idCliente)
		on update cascade
);

alter table cadPF auto_increment = 1;

desc cadPF;

-- criar tabela cadPJ

create table cadPJ(
	idCadPJ int auto_increment,
    idCliente int,
    CNPJ char(15) not null,
    razaoSocial varchar (45) not null,
    nomeFantasia varchar (30),
    rua varchar (100),
    numero int,
    bairro varchar (20),
    cep char (8),
    complemento varchar (20),
    telefone1 char (11) not null,
    telefone2 char (11),
    email varchar (100),
    contato varchar (45),
    primary key (idCadPJ, idCLiente),
    constraint unico_CNPJ_cadPJ unique (CNPJ),
    constraint fk_idcliente_cadPJ foreign key (idCliente) references cliente(idCliente)
		on update cascade
);

alter table cadPJ auto_increment = 1;

desc cadPJ;


-- criar tabela veiculo

create table veiculo(
	idVeiculo int auto_increment,
    idCLiente int,
    codigo int not null,
    descricao varchar (45) not null,
    cor varchar (10) not null, 
    placa varchar (10),
    idClienteAnterior int,
    primary key (idVeiculo, idCliente),
    constraint unica_placa_codigo unique (placa, codigo),
    constraint fk_idCliente_veiculo foreign key (idCliente) references cliente(idCliente)
		on update cascade
);

alter table veiculo auto_increment = 1;

desc veiculo;

-- criar tabela mecanico

create table mecanico(
	idMecanico int auto_increment,
    codigo int not null,
    dataAdmissao date not null,
    dataDemissao date default null,
    CPF char (11) not null,
    nomeCompleto varchar (45) not null,
    rua varchar (100),
    numero int,
    bairro varchar (20),
    cidade varchar (50),
    cep char (8),
    complemento varchar (20),
    datanascimento date,
    telefone1 char (11) not null,
    telefone2 char (11),
    email varchar (100),
    primary key (idMecanico)

);

alter table mecanico auto_increment = 1;

desc mecanico;

-- criar tabela veiculoXmecanico

create table veiculoXmecanico(
	idVeiculoXmecanico int auto_increment,
    idMecanico int,
    idVeiculo int,
    primary key (idVeiculoXmecanico, idMecanico, idVeiculo),
    constraint fk_veiculo_veiculoXmecanico foreign key (idVeiculo) references veiculo(idVeiculo),
    constraint fk_mecanico_veiculoXmecanico foreign key (idMecanico) references mecanico (idmecanico)
		on update cascade
);

alter table  veiculoXmecanico auto_increment = 1;

desc veiculoXmecanico;

-- criar tabela ordemdeServico

create table ordemServico(
	idOrdemServico int auto_increment,
    codigo int not null,
    dataEmissao date,
    previsaoEntregaFinal date,
    validade char (2) default 30,
    valorTotal float,
    idVeiculoXmecanico int,
    tipoDeServico enum ('Revisão','Conserto') not null,
    primary key (idOrdemServico, idVeiculoXmecanico),
    constraint unico_codigo unique (idVeiculoXmecanico),
    constraint fk_idVeiculoXmecanico_ordemServico foreign key (idVeiculoXmecanico) references veiculoXmecanico(idVeiculoXmecanico)
    on update cascade
);

alter table ordemServico auto_increment = 1;

desc ordemServico;

-- criar tabela servico

create table servicoPeca(
	idServicoPeca int auto_increment,
    codigo int,
    descricaoServico varchar (100),
    valorServico float not null,
    tipo enum('Servico','Peca'),
    primary key(idServicoPeca),
    constraint unico_codigo_servico_peca unique (codigo)
);

alter table servicoPeca auto_increment = 1;

desc servicoPeca;

-- criar tabela itemXos

create table itemXos(
	idItemXos int auto_increment,
    idServicoPeca int,
    idordemServico int,
    status enum('Aguardando Autorização','Autorizado','Não Autorizado','Executando Servicos','OS vencida sem autorização','Finalizado') default 'Aguardando Autorização',
    dataAutorização date,
	previsaoEntrega date,
    primary key (idItemXos, idServicoPeca, idOrdemServico),
    constraint fk_idServicoPeca_itemXos foreign key (idServicoPeca) references servicoPeca(idServicoPeca),
    constraint fk_idOrdemServico_itemXos foreign key (idordemServico) references ordemServico (idordemServico)
    on update cascade  
    
);

alter table itemXos auto_increment = 1;

desc itemXos;

show tables;

use information_schema;
show tables;

desc REFERENTIAL_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS
where constraint_schema = 'oficina';

