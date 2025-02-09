--1.  Seleccionar los clientes que viven en el país de "usa"
select country from customers;

select * from customers
where lower (country) ='usa'

-- 2.  Seleccionar los proveedores que viven en la ciudad de "BERLIN"

select city from suppliers;

select * from suppliers
where upper (city)='BERLIN'

--3.  Seleccionar los empleados con código 3,5 y 8

select * from employees;
 
select * from employees
where employee_id=3 or employee_id=5 or employee_id=8;
 
select * from employees
where employee_id in (3,5,8);

-- 4. Seleccionar los productos que tienen stock mayor que cero y son del proveedor 1,3 y 5
select * from suppliers
where supplier_id in (3,5,8);
 
 
select prod.*, su.company_name as "supplier name" from products prod
inner join suppliers su
on prod.supplier_id= su.supplier_id
where su.supplier_id in (3,5,8);
 
-- 5.  Seleccionar los productos con precio mayor o igual a 20 y menor o igual a 90

select * from products
where unit_price between 20 and 90;

-- 6. Mostrar las órdenes de compra entre las fechas 01/01/1997 al 15/07/1997
 
select * from orders 
where order_date between '01/01/1997' and '15/07/1997'

--7. Mostrar las órdenes de compra hechas en el año 1997, que pertenecen a los empleados con códigos 1 ,3 ,4 ,8 

select * from orders
where date_part('year',order_date)=1997 and employee_id in(1,3,4,8);
 
--8. Mostrar las ordenes hechas en el año 1996
select * from orders 
where date_part( 'year',order_date) = 1996
 
 
--9. Mostrar las ordenes hechas en el año 1997 ,del mes de abril
select * from orders 
where date_part( 'year',order_date) = 1997 and date_part( 'month',order_date)= '4'

--10.	Mostrar las ordenes hechas el primero de todos los meses, del año 1998 
select * from orders
where date_part( 'year',order_date) = 1998 and date_part( 'day',order_date) = 1;
 
--11. Mostrar todos los clientes que no tienen fax
select * from customers  
where fax is null
 
 
--12. Mostrar todos los clientes que tienen fax
 
select * from customers  
where fax is not null
 
 --13.	Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece. 

select p.product_name, p.unit_price, p.units_in_stock, c.category_name from products p
inner join categories c
on p.category_id = c.category_id;

--14.	Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de la compañía proveedora. 

select p.product_name, p.unit_price, s.supplier_id, s.company_name from products p
inner join suppliers s 
on p.supplier_id = s.supplier_id;

--15. Mostrar el número de orden, el código del producto, el precio, la cantidad y el total pagado por producto.

select order_id, product_id, unit_price, quantity, (unit_price*quantity) as totalPagado from order_details;
 
--16. Mostrar el número de la orden, fecha, código del producto, precio, código del empleado y su nombre completo.
 
select od.order_id,o.order_date ,od.product_id,od.unit_price,o.employee_id,concat( e.first_name,' ',e.last_name) "employee name" from order_details od
inner join orders o
on od.order_id= o.order_id
inner join employees e
on o.employee_id= e.employee_id;

-- 17. Mostrar los 10 productos con menor stock

select product_name, units_in_stock from products
order by units_in_stock asc
limit 10;

 -- 18. Mostrar los 10 productos con mayor stock
 
select product_name, units_in_stock from products
order by units_in_stock desc
limit 10;

 -- 19. Mostrar los 10 productos con menor precio
 
select products.product_name, products.unit_price from products
order by unit_price asc
limit 10;

-- 20. Mostrar los 10 productos con mayor precio

select products.product_name, products.unit_price from products
order by unit_price desc
limit 10;

-- 21. Mostrar los 10 productos más baratos

select products.product_name, products.unit_price from products
order by unit_price asc
limit 10;

-- 22. Mostrar los 10 productos más caros

select products.product_name, products.unit_price from products
order by unit_price desc
limit 10;

--23. Seleccionar todos los campos de la tabla clientes,ordenar por compania
 
select * from customers
order by company_name asc
 
--24. Seleccionar todos los campos de clientes,cuya compania empiece con la letra B y pertenezcan a UK ,ordenar por nombre de la compania
 
select * from customers
where upper(country)='UK' and company_name like 'B%'
order by company_name asc

-- 25. Seleccionar todos los campos de productos de las categorias 1,3 y 5,ordenar por categoria

select * from products
where category_id in (1,3,5) order by category_id;

-- 26. Seleccionar los productos cuyos precios unitarios estan entre 50 y 200

select products.product_name, products.unit_price from products
where unit_price between 50 and 200;
 
-- 27. Visualizar el nombre y el id de la compania del cliente,fecha,precio unitario y producto de la orden

select cu.contact_name,cu.company_name, o.order_date ,od.unit_price,pro.product_name from order_details od
inner join orders o
on od.order_id= o.order_id
inner join products pro
on pro.product_id= od.product_id
inner join customers cu
on  cu.customer_id = o.customer_id;

-- 28. Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria.

select categories.category_name, count(products.product_id) as Total_de_Productos from products
inner join categories 
on products.category_id = categories.category_id group by categories.category_name;

--29. Seleccionar los 5 productos mas vendidos
 
select product_id,count(*) from order_details
group by product_id
order by count(*) desc
limit 5
  
--30. Seleccionar los jefes de los empleados

select * from employee_territories
select e.employee_id as employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name, e2.employee_id as manager_id, 
e2.first_name as manager_first_name, e2.last_name as manager_last_name from employees e
left join employees e2 
on e.employee_id = e2.employee_id
order by e.employee_id;

-- 31. Obtener todos los productos cuyo nombre comienzan con M y tienen un precio comprendido entre 28 y 129

select product_name, unit_price from products
where unit_price>28 and unit_price<129 and product_name like 'M%';
 
-- 32. Obtener todos los clientes del Pais de USA,Francia y UK

select company_name, country from customers
where country in('UK', 'USA', 'France');

-- 33. Obtener todos los productos descontinuados o con stock cero.

select product_name, units_in_stock, discontinued from products
where discontinued = 1 or units_in_stock = 0;
 
--34. Obtener todas las ordenes hechas por el empleado King Robert
 
select o.*, e.first_name from orders o
inner join   employees e
on o.employee_id = e.employee_id
where  concat(e.last_name,' ',e.first_name)='King Robert';

--35. Obtener todas las ordenes por el cliente cuya compania es "Que delicia"
select * from orders 
select * from  

--36. Obtener todas las ordenes hechas por el empleado King Robert,Davolio Nancy y Fuller Andrew

select distinct o.order_id, concat(e.last_name, ' ',e.first_name) as nombrefull from orders o
inner join employees e
on o.employee_id = e.employee_id
where (e.last_name = 'King' and e.first_name = 'Robert')
or (e.last_name = 'Davolio' and e.first_name = 'Nancy')
or (e.last_name = 'Fuller' and e.first_name = 'Andrew')
order by nombrefull;

--37. Obtener todos los productos(codigo,nombre,precio,stock) de la orden 10257

select od.order_id, od.product_id, p.product_name, p.unit_price, p.units_in_stock from order_details od
inner join products p 
on od.product_id = p.product_id
where od.order_id = 10257;
 
--38. Obtener todos los productos(codigo,nombre,precio,stock) de las ordenes hechas desde 1997 hasta la fecha de hoy.
 
select distinct p.product_name,p.unit_price,p.units_in_stock from order_details od
inner join products p
on od.product_id = p.product_id
inner join  orders o
on o.order_id= od.order_id
where o.order_date between '1997-01-01' and now()
order by  p.product_name asc

-- 39. Calcular los 15 productos mas caros

select p.product_name, p.unit_price from products p
order by unit_price desc
limit 15;

-- 40. Calcular los 5 productos mas baratos

select p.product_name, p.unit_price from products p
order by unit_price asc
limit 5;

-- 41. Obtener el nombre de todas las categorias y los nombres de sus productos,precio y stock.

select distinct category_name, p.product_name, p.unit_price, p.units_in_stock from categories c
inner join products p
on c.category_id = p.category_id;

-- 42. Obtener el nombre de todas las categorias y los nombres de sus productos,solo los productos que su nombre no comience con la letra P

select distinct category_name, p.product_name, p.unit_price, p.units_in_stock from categories c
inner join products p 
on c.category_id = p.category_id
where product_name not like 'P%';
 
--43. Calcular el stock de productos por cada categoria.Mostrar el nombre de la categoria y el stock por categoria.

select c.category_name,sum(p.units_in_stock) from products p
inner join categories c
on p.category_id = c.category_id
group by c.category_name
order by sum(p.units_in_stock) desc

-- 44. Obtener el Nombre del cliente,Nombre del Proveedor,Nombre del empleado y el nombre de los productos que estan en la orden 10794

select o.order_id, c.company_name as cliente, s.company_name as proveedor, concat(e.last_name,' ', e.first_name) as empleado, p.product_name as productos from orders o
inner join customers c
on o.customer_id = c.customer_id 
inner join order_details od 
on o.order_id = od.order_id
inner join products p 
on od.product_id = p.product_id
inner join suppliers s
on p.supplier_id = s.supplier_id
inner join employees e
on o.employee_id = e.employee_id
where o.order_id = 10974;

-- 45. Mostrar el numero de ordenes de cada uno de los clientes por año,luego ordenar codigo del cliente y el año.
select *from customers
select date_part('year',o.order_date) as years, o.customer_id, count(order_id) as Total_ordenes from orders o
group by customer_id, years
order by years, customer_id;
	
-- 46. Contar el numero de ordenes que se han realizado por años y meses ,luego debe ser ordenado por año y por mes.

select date_part('year',o.order_date) as año, date_part('month',o.order_date) as mes, count(order_id) as total_ordenes from orders o
group by mes, years
order by yearss, mes;

-- 47. Seleccionar el nombre de la compañía del cliente,él código de la orden de compra,la fecha de la orden de compra, 
-- código del producto, cantidad pedida del producto,nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor ,usar Join

select c.company_name, o.order_id, o.order_date, od.product_id, od.quantity,
p.product_name, s.company_name, s.city from orders o
inner join customers c 
on o.customer_id = c.customer_id
inner join order_details od 
on o.order_id = od.order_id
inner join products p 
on od.product_id = p.product_id
inner join suppliers s 
on p.supplier_id = s.supplier_id;

-- 48. Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden de compra, 
-- el código del producto,cantidad pedida del producto, nombre del producto y el nombre de la compañía proveedora, usas JOIN.Solamente las compañías 
--proveedoras que comienzan con la letra de la A hasta la letra G,además la cantidad pedida del producto debe estar entre 23 y 187.

select c.company_name, c.contact_name, o.order_id, o.order_date, od.product_id, 
od.quantity, p.product_name,s.company_name from orders o
inner join customers c
on o.customer_id = c.customer_id
inner join order_details od
on o.order_id = od.order_id
inner join products p
on od.product_id = p.product_id
inner join suppliers s 
on p.supplier_id = s.supplier_id
where od.quantity>=23 and od.quantity<=187 
and s.company_name like 'A%'
or s.company_name like 'B%'
or s.company_name like 'C%'
or s.company_name like 'D%'
or s.company_name like 'E%'
or s.company_name like 'F%'
or s.company_name like 'G%';
