--Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina,ciudad
from oficina;

--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad,telefono
from oficina
where codigo_oficina='MAD-ES';
--Otra manera
select ciudad,telefono
from oficina
where pais='España';
--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre,apellido1,apellido2,email
from empleado
where codigo_jefe=7;

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto,nombre,apellido1,apellido2,email
from empleado 
where codigo_empleado=1;
--Otra forma
select puesto,nombre,apellido1,apellido2,email
from empleado
where puesto='Director General';

--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select nombre,apellido1,apellido2,puesto
from empleado
where puesto != 'Representante Ventas';
--Otra forma
select nombre,apellido1,apellido2,puesto
from empleado
where puesto NOT LIKE 'Representante Ventas';
--Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_cliente
from cliente
where pais='Spain';
--Con like
select nombre_cliente
from cliente
where pais like 'Spain';
--Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado
from pedido;
/*Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar 
aquellos códigos de cliente que aparezcan repetidos. */
--Resuelva la consulta:
 --Utilizando la función YEAR de MySQL.
select distinct codigo_cliente
from pago
where year(fecha_pago)='2008';
--Utilizando la función DATE_FORMAT de MySQL.
select distinct codigo_cliente
from pago
where format(fecha_pago,'yyyy')='2008';
--Sin utilizar ninguna de las funciones anteriores.*/
select distinct codigo_cliente
from pago
where fecha_pago >='2008-01-01' and fecha_pago<= '2008-12-31';
--where fecha_pago between '2008-01-01' and '2008-12-31';
--Obtener la fecha actual del sistema
select getdate();
--Utilizando between
select distinct codigo_cliente
from pago 
where fecha_pago between '2008-01-01' and '2008-12-31';
/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de 
entrega de los pedidos que no han sido entregados a tiempo.*/
select codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
from pedido
where estado='pendiente' and ; 
--Otra manera
SELECT p.codigo_pedido,p.codigo_cliente,p.fecha_pedido,p.fecha_entrega
from pedido p 
where p.estado LIKE 'Pendiente'and fecha_entrega IS null;

/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega
ha sido al menos dos días antes de la fecha esperada.*/
--Utilizando la función ADDDATE de MySQL.
select codigo_pedido, codigo_cliente,fecha_esperada,fecha_entrega
from pedido 
where dateadd(day,0,fecha_entrega)=dateadd(day,-2,fecha_esperada);
--Utilizando la función DATEDIFF de MySQL.
select codigo_pedido, codigo_cliente,fecha_esperada,fecha_entrega
from pedido 
where datediff(day,-2,fecha_entrega)=datediff(day,0,fecha_esperada);
--¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
--Creo que no es posible realizar operaciones aritméticas con fechas, ya que se puede utilizar las funciones desarrolladas anteriormente.

--Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select *
from pedido
where estado='Rechazado' and fecha_pedido between '2009-01-01' and '2009-12-31';
--
select *
from pedido
where estado='Rechazado' and fecha_pedido>='2009-01-01' and fecha_pedido<='2009-12-31';

--Otra forma
select *
from pedido
where estado='Rechazado' and year(fecha_pedido)='2009';
--Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
select *
from pedido 
where month(fecha_entrega)='01' and estado='Entregado';

--Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
select *
from pago
where fecha_pago>='2008-01-01' and fecha_pago<='2008-12-31' and forma_pago='PayPal'
order by fecha_pago desc;
--Otra forma
select *
from pago 
where year(fecha_pago)='2008'
order by fecha_pago desc;
/*Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de 
pago repetidas.*/
select distinct forma_pago
from pago;

/*Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. 
El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.*/
select *
from producto
where gama='Ornamentales' and cantidad_en_stock=100
order by precio_venta desc;

/*Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código
de empleado 11 o 30.*/
select *
from cliente
where ciudad='Madrid' and codigo_empleado_rep_ventas=11 or codigo_empleado_rep_ventas=30;
