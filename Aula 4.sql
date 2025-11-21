/*Nova consulta*/
SELECT * from pedidos

SELECT * from itenspedidos

SELECT p.id, c.nome, sum(ip.precounitario) as ValorTotalPedido
from clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
GROUP by p.id, c.nome;

/*Mão na massa: total de pedidos*/

SELECT c.nome, sum(ip.precounitario) as ValorTotalPedido
from clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
GROUP by c.nome;

/*Criando Views*/

SELECT p.id, c.nome, p.datahorapedido, sum(ip.precounitario) as ValorTotalPedido
from clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
GROUP by p.id, c.nome;


create VIEW ViewCliente as
SELECT nome, endereco from clientes;

SELECT * from ViewValorTotalPedido;

CREATE VIEW ViewValorTotalPedido as
SELECT p.id, c.nome, p.datahorapedido, sum(ip.precounitario) as ValorTotalPedido
from clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos ip on p.id = ip.idpedido
GROUP by p.id, c.nome;

/*Utilizando Views*/

SELECT * from ViewValorTotalPedido
WHERE valortotalpedido >10 and valortotalpedido < 15;

SELECT * from ViewValorTotalPedido
WHERE strftime('%m', datahorapedido) = '08';

drop view ViewCliente;

/*Criando TRIGGER*/

SELECT * from pedidos;

SELECT * from itenspedidos;

SELECT date(datahorapedido) as Dia, Sum(ip.precounitario) as FaturamentoDiario from pedidos p
JOIN itenspedidos ip
on p.id = ip.idpedido
GROUP by Dia; 

CREATE TABLE FaturamentoDiario(
  Dia Date,
  FaturamentoTotal Decimal (10,2)
);

create TRIGGER CalculoFaturamentoDiario
after INSERT on itenspedidos
for EACH ROW
BEGIN
DELETE FROM FaturamentoDiario;
INSERT into FaturamentoDiario(Dia, faturamentototal)
SELECT DATE(datahorapedido) as Dia, Sum(ip.precounitario) as FaturamentoDiario from pedidos p
JOIN itenspedidos ip
on p.id = ip.idpedido
GROUP by Dia
order by Dia;
end;

SELECT * from FaturamentoDiario;

/*Executando TRIGGER*/


INSERT INTO Pedidos(ID, IDCliente, DataHoraPedido, Status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');

SELECT * from pedidos;

INSERT INTO ItensPedidos(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES (451, 14, 1, 6.0),
         (451, 13, 1, 7.0);
         
SELECT * from itenspedidos;

INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status) 
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');

INSERT INTO ItensPedidos (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (452, 10, 1, 5.0),
         (452, 31, 1, 12.50);

SELECT * from FaturamentoDiario;
