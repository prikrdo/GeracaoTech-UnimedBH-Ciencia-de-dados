# **Descrição do Desafio**

Neste desafio, foi proposto a realização da criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realizar a persistência de dados para efetivação dos testes. Foi especificado também, a criação de queries SQL com as cláusulas abaixo:

- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

**Algumas das perguntas que podes fazer para embasar as queries SQL:**

- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos fornecedores e estoques;
- Relação de nomes dos fornecedores e nomes dos produtos;

**Perguntas adicionais elaboradas pelo autor:**

- Clientes com mais de um cartão cadastrado;
- fornecedor com quantidade de produtos maior que 1000 em estoque;

**Refinamento realizado nas tabelas**

- [ ] Adicionado parâmetro (if not exists) na criação do database para que não seja criado em duplicidade caso já exista;
- [ ] Adicionado campo extras na tabela de cliente;
- [ ] Unificado o campo nome na tabela cliente;
- [ ] Adicionado o valor na tabela produto;
- [ ] Criado a tabela "pagamento" para guardar os dados de pagamento dos clientes;
- [ ] Adicionado campo de quantidade na tabela "produtoFornecedor"  para visualizar a quantidade de produtos cada fornecedor possui;
- [ ] Adicionado o comando "on update cascade" nas tabelas que possuem Foreign key, para que em caso de updates, as atualizações aconteçam em "cascata";







