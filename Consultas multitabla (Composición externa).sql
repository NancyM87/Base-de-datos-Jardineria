
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.
--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select c.nombre_cliente
from cliente c
left join pago p on c.codigo_cliente=p.codigo_cliente
where p.codigo_cliente IS NULL;
--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select c.nombre_cliente
from cliente c
left join pedido p on c.codigo_cliente=p.codigo_cliente
where p.codigo_cliente IS NULL;
--Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select c.nombre_cliente
from cliente c 
left join pago pg on pg.codigo_cliente=c.codigo_cliente
left join pedido pd on c.codigo_cliente=pd.codigo_cliente
where pg.codigo_cliente IS NULL and pd.codigo_cliente IS NULL;

--Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select em.nombre
from empleado em
left join oficina ofi on em.codigo_oficina=ofi.codigo_oficina
where ofi.codigo_oficina IS NULL;

--Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
select em.nombre+' '+em.apellido1 as empleado
from empleado em
left join cliente c on c.codigo_empleado_rep_ventas=em.codigo_empleado
where c.codigo_empleado_rep_ventas IS NULL
Order by em.nombre asc;

/*Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la 
oficina donde trabajan.*/
select em.nombre+' '+em.apellido1 as empleado,ofi.ciudad,ofi.pais
from empleado em
left join cliente c on c.codigo_empleado_rep_ventas=em.codigo_empleado
left join oficina ofi on em.codigo_oficina=ofi.codigo_oficina
where c.codigo_empleado_rep_ventas IS NULL
Order by em.nombre asc;

--Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
select em.nombre
from empleado em
left join cliente c on em.codigo_empleado=c.codigo_empleado_rep_ventas
left join oficina ofi on em.codigo_oficina=ofi.codigo_oficina
where c.codigo_empleado_rep_ventas IS NULL and ofi.codigo_oficina IS NULL;

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
select *
from producto p 
left join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
left join pedido pd on dp.codigo_pedido=pd.codigo_pedido
where dp.codigo_producto IS NULL;
/*Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, 
la descripción y la imagen del producto.*/

select p.nombre,p.descripcion,gp.imagen
from producto p 
left join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
left join pedido pd on dp.codigo_pedido=pd.codigo_pedido
left join gama_producto gp on gp.gama=p.gama
where dp.codigo_producto IS NULL;
/*Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún 
cliente que haya realizado la compra de algún producto de la gama Frutales.*/
select distinct ofi.*
from empleado em 
left join cliente cl on em.codigo_empleado=cl.codigo_empleado_rep_ventas
left join pedido pd on cl.codigo_cliente=pd.codigo_cliente
left join detalle_pedido dp on pd.codigo_pedido=dp.codigo_pedido
left join producto pr on dp.codigo_producto=pr.codigo_producto
left join gama_producto gp on gp.gama=pr.gama
inner join oficina ofi on em.codigo_oficina=ofi.codigo_oficina
where pr.gama='Frutales' and cl.codigo_empleado_rep_ventas<>em.codigo_empleado;

--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
select  distinct cl.*
from cliente cl
left join pedido pd on cl.codigo_cliente=pd.codigo_cliente
left join pago p on cl.codigo_cliente=p.codigo_cliente
where pd.codigo_cliente IS NOT NULL and p.codigo_cliente IS NULL;
--Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
select distinct em.*
from empleado em
left join cliente cl on em.codigo_empleado=cl.codigo_empleado_rep_ventas
left join empleado ej on em.codigo_empleado=ej.codigo_jefe
where cl.codigo_empleado_rep_ventas IS NULL;