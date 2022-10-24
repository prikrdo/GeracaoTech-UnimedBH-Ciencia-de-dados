use ecomerce;

show tables;
desc cliente;
-- Cliente: idCliente, nomeCompleto, CPF, dataNascimento, Endereco, email, fone1, fone2.
insert into cliente (nomeCompleto, CPF, dataNascimento, Endereco, email, fone1, fone2) 
		values ('Homer Jay Simpson','12345678912','1986-05-12','Evergreen Terrace, 632 - SPRINGFILD','homersimpson@gmail.com','31999999999',null),
				('Bartholomew JoJo-Jay Simpson','98765432198','1980-04-01','Evergreen Terrace, 632 - SPRINGFILD','bartsimpson@gmail.com','31988888888',null),
				('Marjorie Bouvier Simpson','12378945665','1980-10-23','Evergreen Terrace, 632 - SPRINGFILD','marjesimpson@gmail.com','31977777777',null),
				('Lisa Marie Simpson','32165498745','1982-05-09','Evergreen Terrace, 632 - SPRINGFILD','lisasimpson@gmail.com','31966666666',null),
                ('Megie Simpson da Silva','32165498123','1994-10-26','Evergreen Terrace, 632 - SPRINGFILD','magiesimpson@gmail.com','31955555555',null);
                
select * from cliente;

desc produto;
-- produto: idProduto, Pname, valorProduto,Classificacao_Kids,Categoria,Avaliacao,Tamanho.
insert into produto (Pname, valorProduto, Classificacao_Kids, Categoria, Avaliacao, Tamanho)
		values ('Kit Ferramentas Sparta','113.91',0,'Ferramentas','4.7',null),
				('Jogo De Ferramentas Manuais','167.31',0,'Ferramentas','4.3',null),
				('Esmerilhadeira 5''','538.23',0,'Ferramentas','4.9',null),
				('PlayStation 5','4654.90',0,'Games','4.8',null),
				('Nintendo Switch','2564.05',0,'Games','4.9',null),
				('Xbox Series X','4084.91',0,'Games','5.0',null),
				('Notebook Samsung Book','3959.10',0,'Informática','4.7',null);
                
                
select * from produto;
select * from pagamento;

desc pagamento;
-- pagamento: idPagamento, idCliente, cartao1, nomeTitular1, validade1, CPFCNPJtitular1, cartaoPadrao1, cartao2, nomeTitular2, validade2, CPFCNPJtitular2, cartaoPadrao2.
insert into pagamento (idPagamento, idCliente, cartao1, nomeTitular1, validade1, CPFCNPJtitular1, cartaoPadrao1, cartao2, nomeTitular2, validade2, CPFCNPJtitular2, cartaoPadrao2) 
						values 	('1','1','1234567890','Homer J Simpson','2024-06-30','12345678912','1','1234566680','Homer J Simpson','2025-04-25','1234567890','0'),
								('2','2','7894561230','Bart J J Simpson','2024-09-10','98765432198','1', null, null, null, null, null),
								('3','3','4561237890','Marje B Simpson','2025-12-30','12378945665','0','1234567890','Homer J Simpson','2024-06-30','12345678912','1'),
								('4','4','1230456789','Lisa M Simpson','2026-01-30','32165498745','1', null, null, null, null,'0'),
								('5','5','3217894560','Megie S Silva','2028-03-30','32165498123','1',null, null, null, null,'0');

desc pedido;
-- pedido: idPedido,idCliente,Status,Descricao,Frete,PgDinheiro,idPagamento.
insert into pedido (idCliente, Status, Descricao, Frete, PgDinheiro, idPagamento)
					values (1,'Cancelado','descrição',null,1,null),
							(1,'Confirmado','descrição',null,0,1),
                            (2,'Em processamento','descrição',null,0,2),
                            (3,'Confirmado','descrição',null,0,3),
                            (3,'Confirmado','descrição',null,1,null),
                            (3,'Em processamento','descrição',null,0,3),
                            (4,'Em processamento','descrição',null,1,null),
                            (5,'Em processamento','descrição',null,0,5),
                            (5,'Confirmado','descrição',null,1,null),
                            (5,'Em processamento','descrição',null,0,5),
                            (5,'Em processamento','descrição',null,0,5);
                           
select * from pedido;

desc estoque;
-- estoque: idEstoque, local, quantidade.
insert into estoque (local, quantidade)
				values ('São Paulo',150),
						('Minas Gerais',200),
                        ('Rio de Janeiro',500);
                        
desc fornecedor; 
-- fornecedor: idFornecedor, razaoSocial, CNPJ, contato.
insert into fornecedor (razaoSocial, CNPJ,contato) values
				('Fornecimento Ilimitado Ltda','10152325000115','41998887450'),
				('Eletronicos Brasil SA.','51258659000132','21985554775'),
				('Moveis do Brasil Ltda','26159847000119','11905515454'),
				('Celulares e Comunicação Ltda','95259132000120','41998552364');



desc vendedor;
-- Vendedor: idVendedor, razaoSocial, nomeFantasia, CNPJ, CPF, local, contato.
insert into vendedor (razaoSocial, nomeFantasia, CPF, CNPJ, Local, contato) values
				('Vendas de Eletronicos e variados','Vendas & Vendas',null,'12159158000125','Curitiba','41987456321'),
				('Brinquedos Infantis Ltda','Brinquedos e Cia',null,'48159357000137','São Paulo ','11985258741'),
				('Ferramentas Gerais de Operações AS','FERGERO',null,'1313254800131','Rio de Janeiro','21905412563');
                

desc produtosVendedor; 
-- Produto Vendedor: Quantidade_produto;
insert into produtosVendedor(idVendedor, idProduto, quantidade) values
				(1,5,5),
				(2,6,2),
				(3,1,5),
				(1,2,1),
				(2,3,2),
				(3,4,1),
				(1,7,6),
				(2,5,10),
				(3,5,50);
                
select * from produtosPedido;
desc produtosPedido;
-- Produto Pedido: idProduto, idPedido, quantidade, status.
insert into produtosPedido (idProduto, idPedido, quantidade, status) values
				(1,1,1,'Sem estoque'),
				(2,2,1,'Disponivel'),
				(3,3,2,'Disponivel'),
				(4,4,2,'Disponivel'),
				(5,4,1,'Disponivel'),
				(6,5,2,'Disponivel'),
				(7,5,2,'Disponivel'),
                (4,6,2,'Disponivel'),
				(5,7,1,'Disponivel'),
				(6,8,2,'Disponivel'),
				(7,9,2,'Disponivel'),
                (6,10,2,'Disponivel'),
				(7,11,2,'Disponivel');
				
                
desc localEstoque;
-- localEstoque: idProduto, idEstoque, local.
insert into localEstoque (idProduto, idEstoque, local) values 
			(1,1,'São Paulo'),
            (1,2,'Minas Gerais'),
            (1,3,'Rio de Janeiro'),
            (2,1,'São Paulo'),
            (2,2,'Minas Gerais'),
            (2,3,'Rio de Janeiro'),
            (3,1,'São Paulo'),
            (3,2,'Minas Gerais'),
            (3,3,'Rio de Janeiro'),
            (4,2,'Minas Gerais'),
            (5,3,'Rio de Janeiro'),
            (6,2,'Minas Gerais'),
            (7,3,'Rio de Janeiro');
            

desc produtoFornecedor;
-- Produto em estoque: idFornecedor, idProduto, quantidade.
insert into produtoFornecedor (idFornecedor, idProduto, quantidade) values
				(1,1,10),
				(1,2,15),
				(1,3,20),
				(1,4,5),
				(1,5,16),
				(1,6,80),
				(1,7,10),
				(2,1,90),
				(4,7,100),
				(2,2,120),
				(2,3,130),
				(2,4,200),
				(2,5,150),
				(2,6,199),
				(2,7,154),
				(3,1,200),
				(3,2,200),
				(3,3,200),
				(3,4,200),
				(3,5,200),
				(3,6,200),
				(3,7,200);
                
                
                
-- Qual a quantidade de clientes cadastrados? 
 select count(*) as Qtde_Clientes from cliente;
 
-- Quantos pedidos foram feitos por cada cliente?
select idCLiente, count(*) as Pedido_X_Cliente from pedido
group by idCliente;


-- Algum vendedor também é fornecedor?

select a.razaoSocial from vendedor a
inner join fornecedor b on b.cnpj = a.cnpj; 

-- Relação de produtos por fornecedores e estoques;
select  c.razaosocial as Fornecedor, a.pname as Produto, b.quantidade as qtd_estoque_fornecedor, e.local
 -- *
 from produto a
inner join produtofornecedor b on b.idproduto = a.idProduto
inner join fornecedor c on c.idfornecedor = b.idfornecedor 
inner join localestoque d on d.idproduto = a.idproduto
inner join estoque e on e.idestoque = d.idestoque
order by fornecedor;

-- Relação de nomes dos fornecedores e nomes dos produtos;

select razaosocial as Nome_Fornecedor from fornecedor;

select pname as Nome_produto from produto;

-- fornecedor com quantidade de produtos maior que 1000 em estoque
select  c.razaosocial as Fornecedor, sum(b.quantidade) as qtd_estoque_fornecedor
 from produto a
inner join produtofornecedor b on b.idproduto = a.idProduto
inner join fornecedor c on c.idfornecedor = b.idfornecedor 
inner join localestoque d on d.idproduto = a.idproduto
inner join estoque e on e.idestoque = d.idestoque
group by 1
 having sum(b.quantidade) > 1000
order by fornecedor;

-- Clientes com mais de um cartão cadastrado

select nomecompleto, pagamento.* from cliente
inner join pagamento on pagamento.idcliente = cliente.idcliente
where cartao1 and cartao2 is not null; 


