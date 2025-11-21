/*Utilizando o UNION*/
SELECT rua, bairro, cidade, estado, cep from colaboradores
UNION
SELECT rua, bairro, cidade, estado, cep from fornecedores;

/*Utilizando o UNION ALL*/
SELECT nome, rua, bairro, cidade, estado, cep from colaboradores
UNION all
SELECT nome, rua, bairro, cidade, estado, cep from fornecedores;

/*Executando subconsultas*/
SELECT nome, telefone from clientes
where id = (SELECT idcliente from pedidos
where datahorapedido = '2023-01-02 08:15:00');

/*Mão na massa*/

SELECT nome from alunos
where id_aluno = (SELECT id_aluno from notas where Nota = (MAX(nota) from notas));

/*Subconsultas no comando IN*/

SELECT idcliente from pedidos where STRFTIME('%m', datahorapedido) = '01';

SELECT nome from clientes WHERE id = (SELECT idcliente from pedidos where STRFTIME('%m', datahorapedido) = '01');

SELECT nome from clientes WHERE id IN (SELECT idcliente from pedidos where STRFTIME('%m', datahorapedido) = '01');

/*Subconsultas com HAVING*/

SELECT avg(preco) from produtos;

SELECT nome, preco from produtos GROUP by nome, preco
HAVING preco > (SELECT avg(preco) from produtos);