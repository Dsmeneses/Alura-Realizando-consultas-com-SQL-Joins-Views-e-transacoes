/* INNER JOIN*/
SELECT c.nome, p.id, p.datahorapedido from clientes as c
INNER JOIN pedidos as p 
on c.id = p.idcliente;

/*RIGHT JOIN*/

INSERT INTO Produtos (ID, Nome, Descricao, Preco, Categoria) VALUES 
(31, 'Lasanha à Bolonhesa', 'Deliciosa lasanha caseira com molho bolonhesa', 12.50, 'Almoço');

SELECT * from produtos;

SELECT pr.nome,  x.idproduto,  x.idpedido 
FROM(
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id = ip.idpedido
    WHERE strftime('%m', p.DataHoraPedido) = '10' ) x
RIGHT JOIN produtos pr
ON pr.id =  x.idproduto;

/* Mão na massa: encontrando clientes sem pedidos*/

SELECT * FROM Pedidos p
RIGHT JOIN clientes c
ON c.ID = p.IDcliente;

SELECT * FROM Pedidos p
RIGHT JOIN clientes c
ON c.ID = p.IDcliente
WHERE p.IDcliente IS NULL;

SELECT c.nome FROM Pedidos p
RIGHT JOIN clientes c
ON c.ID = p.IDcliente
WHERE p.IDcliente IS NULL;

/*LEFT JOIN*/

SELECT c.nome, x.id from clientes c
LEFT JOIN 
	(SELECT p.id, p.idcliente from pedidos p WHERE strftime('%m', p.DataHoraPedido) = '10') x
on c.id = x.idcliente
WHERE x.idcliente is NULL;

/*FULL JOIN*/

SELECT c.nome, p.id from clientes c
full JOIN pedidos p
on c.id = p.idcliente;

      
