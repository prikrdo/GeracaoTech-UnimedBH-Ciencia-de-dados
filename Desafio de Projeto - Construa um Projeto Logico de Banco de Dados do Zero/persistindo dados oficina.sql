use oficina;

show tables;

desc cliente;

insert into cliente (codigo) 
		values  (1),
				(2),
                (3),
                (4),
                (5),
                (6),
                (7);
                
select * from cliente;

desc cadpf;
-- cadpf: idCadpf,idCliente,CPF,nomeCompleto,rua,numero,bairro,cep,complemento,telefone1,telefone2,email	
insert into cadpf (idCliente,CPF,nomeCompleto,rua,numero,bairro,cidade,cep,complemento,datanascimento,telefone1,telefone2,email)
		values  (1,'12345678912','Homer Jay Simpson','Evergreen Terrace', 632,'Center','SPRINGFILD',35706902,null,'1986-05-12','31999999999',null,'homersimpson@gmail.com'),
				(2,'98765432198','Bartholomew JoJo-Jay Simpson','Evergreen Terrace', 632,'Center','SPRINGFILD',35706902,null,'1980-04-01','31988888888',null,'bartsimpson@gmail.com'),
				(3,'12378945665','Marjorie Bouvier Simpson','Evergreen Terrace', 632,'Center','SPRINGFILD',35706902,null,'1980-10-23','31977777777',null,'marjesimpson@gmail.com'),
				(4,'32165498745','Lisa Marie Simpson','Evergreen Terrace', 632,'Center','SPRINGFILD',35706902,null,'1982-05-09','31966666666',null,'lisasimpson@gmail.com'),
                (5,'32165498123','Megie Simpson da Silva','Evergreen Terrace', 632,'Center','SPRINGFILD',35706902,null,'1994-10-26','31955555555',null,'magiesimpson@gmail.com');

                
select * from cadpf;

desc cadpj;
-- cadpj: idCadPJ,idCliente,CNPJ,razaoSocial,nomeFantasia,rua,numero,bairro,cep,complemento,telefone1,telefone2,email,contato
insert into cadpj (idCliente,CNPJ,razaoSocial,nomeFantasia,rua,numero,bairro,cep,complemento,telefone1,telefone2,email,contato)
		values  (6,'10152325000115','Jose comercio de pedras LTDA','Zé das Pedras','Antonio de Almeida',55,'Santo Augusto',35703498,null,31980459078,31979604980,'zedaspedras@zedaspedras.com.br','Jose Aloisio de Almeida'),
				(7,'51258659000132','LocFacil locadora de vaiculos LTDA','LocFAcil','Xiquinho Avelar',202,'São Miguel',35740987,null,31976523146,31980517364,'locfacil@locfacil.com.br','Augusto de Almeida Fontinelli');

select * from cadpj;

desc veiculo;
-- veiculo: idVeiculo,idCLiente,codigo,descricao,cor,placa,idClienteAnterior
insert into veiculo (idCLiente,codigo,descricao,cor,placa,idClienteAnterior)
		values  (1,1,'Fiat Mobi','Prata','OQZ2580',NULL),	
				(2,2,'Renault Kwid','Branco','OQW2550',NULL),
                (3,3,'Citroën C3','Branco','ZWO4444',NULL),
                (4,4,'Fiat Argo','Preto','ZKQ4670',NULL),
                (5,5,'Hyundai HB20','Preto','ABC1234',NULL),
                (6,6,'Volkswagen Gol','Vermelho','ASD4567',NULL),
                (6,7,'Renault Stepway','Vermelho','QWE7890',NULL),
                (7,8,'Peugeot 208','Cinza','RTY9074',NULL),
                (7,9,'Fiat Cronos','Prata','FGH5490',NULL),
                (7,10,'Chevrolet Onix','Vermelho','LKJ5046',NULL);
                
select * from veiculo;

desc mecanico;
-- mecanico: idMecanico,codigo,dataAdmissao,dataDemissao,CPF,nomeCompleto,rua,numero,bairro,cidade,cep,complemento,datanascimento,telefone1,telefone2,email
insert into mecanico (codigo,dataAdmissao,dataDemissao,CPF,nomeCompleto,rua,numero,bairro,cidade,cep,complemento,datanascimento,telefone1,telefone2,email) 
values  (1,'2021-08-01',null,'65485200418','Sebastiao de Almeida Valadares','Juaquim Murtinho', 62,'Center','Belo Horizonte',35406701,null,'1982-10-25','31950847695',null,'sebastiaoavaladares@gmail.com'),
		(2,'2022-01-01',null,'09870210878','Augusto Batista de Oliveira','Jovelino Lanza', 555,'Esmeraldas','Belo Horizonte',36700159,null,'1980-06-17','31986047560',null,'augustoboliveira@gmail.com'),
        (3,'2022-06-01',null,'09486800031','Robson de Menezes','Terra Vermelha', 504,'Terrao','Belo Horizonte',35709875,null,'1979-03-09','31987620457',null,'robsonm@gmail.com');
        
select * from mecanico;

desc veiculoXmecanico;
-- veiculoXmecanico: idVeiculoXmecanico,idMecanico,idVeiculo
insert into veiculoXmecanico (idMecanico,idVeiculo)
	values  (1,3),
			(1,5),
            (2,2),
            (2,1),
            (2,4),
            (3,8),
            (3,10);
            
select * from veiculoXmecanico;

desc ordemServico;
-- ordemServico: idOrdemServico,codigo,dataEmissao,previsaoEntregaFinal,validade,valorTotal,idVeiculoXmecanico,tipoDeServico
insert into ordemServico (codigo,dataEmissao,previsaoEntregaFinal,validade,valorTotal,idVeiculoXmecanico,tipoDeServico)  
values  (1,'2022-09-01','2022-09-10',30,2500.00,1,'Conserto'),
		(2,'2022-09-12','2022-09-15',30,1500.00,2,'Conserto'),   
        (3,'2022-09-12','2022-09-16',30,2000.00,3,'Conserto'),   
        (4,'2022-09-26','2022-10-01',30,3000.00,4,'Conserto'),   
        (5,'2022-10-03','2022-10-06',30,800.00,5,'Revisão'),   
        (6,'2022-10-07','2022-10-10',30,3000.00,6,'Revisão'),   
        (7,'2022-10-26','2022-11-01',30,1000.00,7,'Conserto');  
        
        select * from ordemServico;

desc servicoPeca;
-- servicopeca: idServicoPeca,codigo,descricaoServico,valorServico,tipo
insert into servicoPeca (codigo,descricaoServico,valorServico,tipo)
			values  (1,'Manutenção da embreagem',200.00,'Servico'),
					(2,'Revisão dos componentes de Freio',150.00,'Servico'),
                    (3,'Revisão no Sistema de Arrefecimento',250.00,'Servico'),
                    (4,'Troca de óleo do motor',50.00,'Servico'),
                    (5,'Troca de óleo do câmbio automático',150.00,'Servico'),
                    (6,'Troca de filtros',100.00,'Servico'),
                    (7,'Troca de lâmpadas',75.00,'Servico'),
                    (8,'Alinhamento e Balanceamento',250.00,'Servico'),
                    (9,'Kit embreagem',1150.00,'Peca'),
                    (10,'Pastilhas de Freio Fras-le PD/528 - Jogo',450.00,'Peca'),
                    (11,'Radiador',110.00,'Peca'),
                    (12,'Valvula Termostatica',230.00,'Peca'),
                    (13,'Sensor de Temperatura',180.00,'Peca'),
                    (14,'Bomba dagua',40.00,'Peca'),
                    (15,'4 Litros de Óleo 10W40 F30 Elaion Semissintético',80.00,'Peca'),
                    (16,'5 Litros de Óleo Mobil 5W20 Sintético',95.00,'Peca'),
                    (17,'7 Litros Óleo Móbil Super 5w40 502 Api Sn Sintético',250.00,'Peca'),
                    (18,'Unidade Óleo Mobil Super 5w-40 Sintético',30.00,'Peca'), 
                    (19,'Filtro de Ar',135.00,'Peca'), 
                    (20,'Filtro do Evaporador',205.00,'Peca'), 
                    (21,'Filtro de Oleo',75.00,'Peca'), 
                    (23,'Kit Lampadas Automotivas',285.00,'Peca');
                    
select * from servicoPeca;

desc itemXos;
-- itemXos: idItemXos,idServicoPeca,status,dataAutorização,previsaoEntrega --status:('Aguardando Autorização','Autorizado','Não Autorizado','Executando Servicos','OS vencida sem autorização','Finalizado')
insert into itemXos (idServicoPeca,idordemServico,status,dataAutorização,previsaoEntrega)
		values  (1,1,'OS vencida sem autorização',null,'2022-09-10'),
				(2,1,'OS vencida sem autorização',null,'2022-09-10'),
				(4,1,'OS vencida sem autorização',null,'2022-09-10'),
				(8,1,'OS vencida sem autorização',null,'2022-09-10'),
				(9,1,'OS vencida sem autorização',null,'2022-09-10'),
				(10,1,'OS vencida sem autorização',null,'2022-09-10'),
				(15,1,'OS vencida sem autorização',null,'2022-09-10'),
				(1,2,'Finalizado','2022-09-12','2022-09-15'),
                (22,2,'Finalizado','2022-09-12','2022-09-15'),
                (20,2,'Finalizado','2022-09-12','2022-09-15'),
                (4,2,'Finalizado','2022-09-12','2022-09-15'),
                (8,2,'Finalizado','2022-09-12','2022-09-15'),
                (7,2,'Finalizado','2022-09-12','2022-09-15'),
                (10,2,'Finalizado','2022-09-12','2022-09-15'),
                (15,2,'Finalizado','2022-09-12','2022-09-15'),
                (5,2,'Finalizado','2022-09-12','2022-09-15'),
                (21,2,'Finalizado','2022-09-12','2022-09-15'),
                (17,2,'Finalizado','2022-09-12','2022-09-15'),
                (2,3,'Finalizado','2022-09-12','2022-09-16'),
                (4,3,'Finalizado','2022-09-12','2022-09-16'),
                (6,3,'Finalizado','2022-09-12','2022-09-16'),
                (8,3,'Finalizado','2022-09-12','2022-09-16'),
                (10,3,'Finalizado','2022-09-12','2022-09-16'),
                (12,3,'Finalizado','2022-09-12','2022-09-16'),
                (14,3,'Finalizado','2022-09-12','2022-09-16'),
                (16,3,'Finalizado','2022-09-12','2022-09-16'),
                (3,4,'Não Autorizado','2022-09-29','2022-10-01'),
                (6,4,'Não Autorizado','2022-09-29','2022-10-01'),
                (9,4,'Não Autorizado','2022-09-29','2022-10-01'),
                (12,4,'Não Autorizado','2022-09-29','2022-10-01'),
                (15,4,'Não Autorizado','2022-09-29','2022-10-01'),
                (8,5,'Finalizado','2022-10-03','2022-10-06'),
                (4,6,'Finalizado','2022-10-07','2022-10-10'),
                (8,6,'Finalizado','2022-10-07','2022-10-10'),
                (12,6,'Finalizado','2022-10-07','2022-10-10'),
                (16,6,'Finalizado','2022-10-07','2022-10-10'),
                (20,6,'Finalizado','2022-10-07','2022-10-10'),
                (22,6,'Finalizado','2022-10-07','2022-10-10'),
                (17,6,'Finalizado','2022-10-07','2022-10-10'),
                (13,6,'Finalizado','2022-10-07','2022-10-10'),
                (8,7,'Autorizado','2022-10-26','2022-11-01');
                
                

-- Qual a quantidade de clientes cadastrados?
select count(*) as qtde_clientes from cliente;
 
-- Quantas OS foram feitos por cliente?

select c.nomecompleto as Cliente, count(c.idcliente) as Qtd_OS  from ordemservico
	inner join veiculoxmecanico a on a.idveiculoxmecanico = ordemservico.idveiculoxmecanico
    inner join veiculo b on b.idveiculo = a.idveiculo
    inner join cadpf c on c.idcliente = b.idcliente
    group by c.idcliente
    
    union 

select f.razaosocial as Cliente, count(f.idcliente) as QtdOS  from ordemservico
	inner join veiculoxmecanico d on d.idveiculoxmecanico = ordemservico.idveiculoxmecanico
    inner join veiculo e on e.idveiculo = d.idveiculo
    inner join cadpj f on f.idcliente = e.idcliente
    group by f.idcliente
;

-- Existe cliente com mais de um veiculo cadastrado?

select idcliente from veiculo
group by idcliente
having count(*) > 1
;


-- qual a os mais recente?
select  * from ordemservico
order by dataemissao desc
limit 1
;

-- Quais ordem de servico venceram?

select ordemservico.* from ordemservico
inner join itemxos on itemxos.idordemservico = ordemservico.idordemservico 
where itemxos.status = 'OS vencida sem autorização'
group by ordemservico.idordemservico;


show tables;

    