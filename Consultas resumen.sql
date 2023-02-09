--¿Cuántos empleados hay en la compañía?
select count(*) as 'cantidad de empleados'
from empleado;
--¿Cuántos clientes tiene cada país?
select count(*) as cantidad_cliente, cl.pais
from cliente cl 
group by cl.pais;
--¿Cuál fue el pago medio en 2009?
select avg(total) as medio
from pago p
where year(p.fecha_pago)='2009';
--¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select count(*) as 'cantidad de pedido',p.estado
from pedido p
group by p.estado
order by 'cantidad de pedido' desc;
Calcula el precio de venta del producto más caro y más barato en una misma consulta.

Calcula el número de clientes que tiene la empresa.

¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

Calcula el número de clientes que no tiene asignado representante de ventas.

Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

Calcula el número de productos diferentes que hay en cada uno de los pedidos.

Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

La misma información que en la pregunta anterior, pero agrupada por código de producto.

La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.