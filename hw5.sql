-- Prabhas Kumra
-- HW #5


-- 1. names of the parts that cost less than $20.00
select PNAME from Parts where PRICE < 20;

-- 2. Names and the cities of employees who hace taken orders for parts costing more than $50
select e.ENAME, z.CITY 
    from Employees e, 
        Zipcodes z, 
        Orders o, 
        Odetails d, 
        Parts p 
    where e.ZIP = z.ZIP and 
        e.ENO = o.ENO and 
        o.ONO = d.ONO and 
        d.PNO = p.PNO and 
        p.PRICE > 50.00;

-- 3. Get the pairs of customer number values of customers having the same zip code
select c1.CNO, c2.CNO 
    from Customers c1, Customers c2 
    where c1.ZIP = c2.ZIP and c1.CNO < c2.CNO;


-- 4. get the name of customers who hace ordered parts form employees living in Wichita.
select CNAME 
    from Customers 
    where not exists( 
        select * 
        from Orders o, Employees e, Zipcodes z  
        where o.CNO = Customers.CNO and 
        o.ENO = e.ENO and 
        e.ZIP = z.ZIP and 
        z.CITY <> 'Wichita');


-- 5. Get the names of customers who have ordered parts ONLY from employees living in Wichita
select CNAME 
    from Customers 
    where not exists( 
        select * 
        from Orders o, Employees e, Zipcodes z  
        where o.CNO = Customers.CNO and 
        o.ENO = e.ENO and 
        e.ZIP = z.ZIP and 
        z.CITY <> 'Wichita');



-- 6. Get anmes of customers who have ordered ALL parts costing less thean $20.00
select CNAME 
from Customers c 
where not exists ( 
        select * 
        from Parts p 
        where p.PRICE < 20.00 and 
                not exists ( 
                    select * 
                    from Orders o, Odetails d 
                    where o.ONO = d.ONO and 
                          o.CNO = c.CNO and 
                          p.PNO = d.PNO ));


-- 7. Get the names of employees along with the total sales 1995

select  e.ENAME, sum(p.PRICE*d.QTY)
from  Employees e, Orders o, Odetails d, Parts p 
where e.ENO=o.ENO and
 	  o.ONO=d.ONO and
	  d.PNO=p.PNO and
	  o.SHIPPED = '1995'
    group by e.ENO;


-- 8. Get the numbers and names of employees who hace never made a sale to a customer living in the same zip code as the employee
select e.ENO, e.ENAME
from Employees e, Customers c 
where e.ZIP = c.ZIP;



-- 9. Get the names of customers who hace placed the highest numbers of orders.
select  CNO, count(*) 
    from Orders
    group by CNO;


-- 10. Get the names of customers eho hace placed the most expensive orders
select c.CNAME
from Customers c, Parts p 
where p.PRICE > 20;


-- 11. Get the names of parts that havebeen ordered the nost (in terms of quantity ordered, not number of orders)
select PNAME
from Odetails o, 
    Parts p 
    where o.PNO = p.PNO and 
    QTY = 4;


-- 12. Get the names of parts along with the number of orders they appear in sorted order of the number of orders.

select p.PNAME, count(o.ONO) total
from Parts p, Odetails d, Orders o 
where o.ONO = d.ONO AND
      p.PNO = d.PNO
group by d.PNO, p.PNAME
order by total desc;

