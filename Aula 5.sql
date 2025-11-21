/*Atualizando dados*/
PRAGMA foreign_keys = On;

SELECT * from produtos;

UPDATE produtos set preco = 13.0 where id = 31;

SELECT * from produtos where nome like 'Croissant%';

update produtos set descricao = 'Croissant recheado com amêndoas' where id = 28;

/*Excluindo dados*/

SELECT * from colaboradores;

delete from colaboradores where id = 3;

SELECT * from clientes where id = 27;

SELECT * from pedidos where idcliente = 27;

SELECT * from itenspedidos where idpedido = 451;

/*ON DELETE ON CASCADE - Apaga todos registros refentes ao ID inserido no Delete*/
delete FROM clientes where id = 27;

/*Iniciando transações*/

UPDATE pedidos SET status = 'Concluído'

BEGIN TRANSACTION;
SELECT * from clientes
SELECT * from pedidos
UPDATE pedidos SET status = 'Concluído' where status = 'Em Andamento'
DELETE FROM clientes
ROLLBACK;
COMMIT;