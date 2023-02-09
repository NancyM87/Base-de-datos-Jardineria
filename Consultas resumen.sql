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
