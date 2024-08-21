use Pizza_DB;

--1. Total Revenue:
select sum(total_price) as Revenue 
from pizza_sales;

--2. Average Order Value
select sum(total_price)/ count(distinct(order_id)) as Average_order_value 
from pizza_sales;

--3. Total Pizzas Sold
select sum(quantity) as Total_pizza_solde 
from pizza_sales;

--4. Total Orders
select count(distinct(order_id)) as Total_Orders from pizza_sales;

--5. Average Pizzas Per Order
select cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as Average_pizza_per_order
from pizza_sales;

--Average quantity per order = total quantity / Number of orders
--Using CAST, we can obtain accurate result.

--6. Daily Trend for Total Orders
select DATENAME(DW, order_date) as Order_days, count(distinct(order_id)) as Total_Orders 
from pizza_sales
group by DATEPART(DW,order_date),DATENAME(DW, order_date)
order by DATEPART(DW,order_date);

--DATEPART used to display Day names in correct order

--7. Monthly Trend for Orders
select DATENAME(MONTH, order_date) as Months, count(distinct(order_id)) as Total_orders 
from pizza_sales
group by MONTH(order_date),DATENAME(MONTH, order_date)
order by MONTH(order_date);

--MONTH(order_date) id used for month order

--8. % of Sales by Pizza Category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Revenue,
cast(sum(total_price)* 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category;

--9. % of Sales by Pizza Size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Revenue,
cast(sum(total_price)* 100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size;

--10. Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) Total_pizza_sold
from pizza_sales
group by pizza_category
order by sum(quantity);

--11. Top 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by sum(total_price) desc;

--12. Bottom 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by sum(total_price);

--13. Top 5 Pizzas by Quantity
select top 5 pizza_name, sum(quantity) as Revenue
from pizza_sales
group by pizza_name
order by sum(quantity) desc;

--14. Bottom 5 Pizzas by Quantity
select top 5 pizza_name, sum(quantity) as Revenue
from pizza_sales
group by pizza_name
order by sum(quantity);

--15. Top 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Order
from pizza_sales
group by pizza_name
order by Total_Order desc;

--16. Bottom 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Order
from pizza_sales
group by pizza_name
order by Total_Order;

select * from pizza_sales;



