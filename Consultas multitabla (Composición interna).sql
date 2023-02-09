/*Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben
resolver con INNER JOIN y NATURAL JOIN.*/
--Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select c.nombre_cliente,em.nombre+' '+em.apellido1 as 'representante ventas'
from cliente c
inner join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado;

--Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select c.nombre_cliente,em.nombre+' '+em.apellido1 as 'representante de ventas'
from cliente c
inner join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
inner join pago p on c.codigo_cliente=p.codigo_cliente;
--Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select c.nombre_cliente,em.nombre+' '+em.apellido1 as 'representante de ventas'
from cliente c
left join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
left join pago p on c.codigo_cliente=p.codigo_cliente
where p.codigo_cliente IS NULL;
/*Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina
a la que pertenece el representante.*/
select distinct c.nombre_cliente,em.nombre+' '+em.apellido1 as 'representantes',ofi.ciudad
from cliente c
inner join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
inner join pago p on c.codigo_cliente=p.codigo_cliente
inner join oficina ofi on ofi.codigo_oficina=em.codigo_oficina;

/*Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina 
a la que pertenece el representante.*/

select distinct c.nombre_cliente,em.nombre+' '+em.apellido1 as 'representantes',ofi.ciudad
from cliente c
left join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
left join pago p on c.codigo_cliente=p.codigo_cliente
left join oficina ofi on ofi.codigo_oficina=em.codigo_oficina
where p.codigo_cliente IS NULL;

--Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select ofi.linea_direccion1,ofi.linea_direccion2,c.nombre_cliente
from cliente c 
inner join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
inner join oficina ofi on em.codigo_oficina=ofi.codigo_oficina
where c.ciudad='Fuenlabrada';
/*Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece
el representante.*/
select c.nombre_cliente,em.nombre as 'representantes',ofi.ciudad
from cliente c
inner join empleado em on c.codigo_empleado_rep_ventas=em.codigo_empleado
inner join oficina ofi on ofi.codigo_oficina=em.codigo_oficina;

--Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select em.nombre+' '+em.apellido1 as empleado,e.nombre+' '+e.apellido1 as jefe
from empleado em 
inner join empleado e on em.codigo_jefe=e.codigo_empleado;

--Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
select em.nombre+' '+em.apellido1 as empleado,e.nombre+' '+e.apellido1 as jefe
from empleado em 
inner join empleado e on em.codigo_jefe=e.codigo_empleado
where e.codigo_jefe=3;
--Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select c.nombre_cliente,p.fecha_entrega,p.fecha_esperada
from cliente c
inner join pedido p on c.codigo_cliente=p.codigo_cliente
where p.fecha_entrega>p.fecha_esperada
order by c.nombre_cliente asc;

--Otra forma
select c.nombre_cliente,p.fecha_entrega,p.fecha_esperada
from cliente c
inner join pedido p on c.codigo_cliente=p.codigo_cliente
where p.fecha_esperada<p.fecha_entrega
order by c.nombre_cliente asc;
--Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select  c.nombre_cliente,pr.nombre as producto,gp.gama,gp.descripcion_texto
from cliente c
inner join pedido p on c.codigo_cliente=p.codigo_cliente
inner join detalle_pedido dp on p.codigo_pedido=dp.codigo_pedido
inner join producto pr on dp.codigo_producto=pr.codigo_producto
inner join gama_producto gp on pr.gama=gp.gama
order by c.nombre_cliente;