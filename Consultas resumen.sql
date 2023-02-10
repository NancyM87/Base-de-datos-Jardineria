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
group by p.estado;

--Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select nombre as 'nombre producto', max(precio_venta) as mas_caro,min(precio_venta) as mas_barato
from producto
group by nombre;
--Calcula el número de clientes que tiene la empresa.
select count(*) as 'numero clientes'
from cliente;
--¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
select count(*) as 'cantidad cliente'
from cliente
where ciudad='Madrid';

--¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
select count(*) as 'cantidad clientes',ciudad
from cliente
where ciudad like 'M%'
group by ciudad;
--Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
select em.nombre, em.apellido1,count(*) as 'cantidad clientes'
from empleado em
inner join cliente cl on em.codigo_empleado=cl.codigo_empleado_rep_ventas
group by em.nombre, em.apellido1;
--Otra forma
select distinct codigo_empleado_rep_ventas, count(*) 
from cliente 
group by codigo_empleado_rep_ventas;

--Calcula el número de clientes que no tiene asignado representante de ventas.
select count(*) as 'cantidad clientes'
from cliente
where codigo_empleado_rep_ventas IS NULL;
/*Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos
de cada cliente.*/
select nombre_cliente,apellido_contacto,min(pg.fecha_pago) as primer_pago,max(pg.fecha_pago) as ultimo_pago
from cliente cl
inner join pago pg on cl.codigo_cliente=pg.codigo_cliente
group by nombre_cliente,apellido_contacto;
--Otra forma
select codigo_cliente, min(fecha_pago),max(fecha_pago)
from pago 
group by codigo_cliente;

--Calcula el número de productos diferentes que hay en cada uno de los pedidos.
select distinct dp.codigo_pedido,count(*) as 'numero productos'
from producto pr
inner join detalle_pedido dp on pr.codigo_producto=dp.codigo_producto
group by dp.codigo_pedido;
--Otra forma
select distinct codigo_pedido,count(*) as 'cantidad producto'
from detalle_pedido
group by codigo_pedido;

--Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
select codigo_pedido,sum(cantidad) as 'cantidad total'
from detalle_pedido
group by codigo_pedido;
/*Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno.
El listado deberá estar ordenado por el número total de unidades vendidas.*/
select top(20) codigo_producto,cantidad
from detalle_pedido
order by cantidad desc;
/*La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado.
La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido.
El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.*/
select (precio_unidad*cantidad) as base_imponible,(0.21*(precio_unidad*cantidad)) as iva,
((precio_unidad*cantidad)+(0.21*(precio_unidad*cantidad))) as total_facturado
from detalle_pedido;
--La misma información que en la pregunta anterior, pero agrupada por código de producto.
select codigo_producto,(precio_unidad*cantidad) as base_imponible,(0.21*(precio_unidad*cantidad)) as iva,
((precio_unidad*cantidad)+(0.21*(precio_unidad*cantidad))) as total_facturado
from detalle_pedido
order by codigo_producto asc;

--La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
select codigo_producto,(precio_unidad*cantidad) as base_imponible,(0.21*(precio_unidad*cantidad)) as iva,
((precio_unidad*cantidad)+(0.21*(precio_unidad*cantidad))) as total_facturado
from detalle_pedido
where codigo_producto like 'OR%'
order by codigo_producto asc;
/*Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, 
total facturado y total facturado con impuestos (21% IVA).*/
select codigo_producto,cantidad, (cantidad*precio_unidad) as total_facturado, 
(cantidad*precio_unidad)+ (cantidad*precio_unidad)*0.21 as total_facturado_con_IVA 
from detalle_pedido 
where (cantidad*precio_unidad) + (cantidad*precio_unidad)*0.21 > 3000;
--Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
select sum(total)as 'suma total',year(fecha_pago) as años
from pago
group by fecha_pago;
