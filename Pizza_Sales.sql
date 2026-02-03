-----------SQL Queries-Pizza Sales--------
---Total Revenue:
select * from Pizza_Sales
select cast(sum(total_price)as decimal(10,2))as total_Revenue from Pizza_sales

---Average Order Value
select sum(total_price)/count(Distinct order_id)as Average_Order_Value from Pizza_Sales

----Total Pizzas Sold
select Sum(quantity)as No_Of_Pizza_Sold from Pizza_Sales

----Total Orders
select count(distinct order_id)as Total_No_Of_Orders from  Pizza_sales

Charts:
----Average Pizzas Per Order----
select sum(quantity	)/count(distinct order_id)as Avg_Pizzas_Per_Order from Pizza_Sales


----% of Sales by Pizza Size---------
select count(distinct order_id)as Total_Orders from Pizza_Sales
select (Sum(quantity)/count(distinct order_id))as Avg_Pizza_Per_Order from Pizza_Sales

-----Daily Trend for Total Orders-----
select Datename(DW,order_date)as Order_Day,
count(distinct order_id) as No_Of_Orders from Pizza_Sales
group by DATENAME(DW,order_date)
Order by Order_Day desc

-----Monthly Trend for Orders----
select datename(MONTH,order_date)as Month_Name,
count(distinct order_id)as Total_Orders
from Pizza_Sales
group by datename(Month,order_date)
order by Total_Orders desc

-----% of Sales by Pizza Size-------
select pizza_category,sum(total_price)as Total_Sales,
sum(total_price)*100/(select sum(total_price)from Pizza_Sales)as Percenatge from Pizza_Sales as Percentage

-----Top 5 Pizzas by Revenue------
select top 5 pizza_name,cast(sum(total_price)as decimal(10,2))as Revenue from Pizza_Sales
group by pizza_name
order by Revenue desc

-----Bottom 5 Pizzas by Revenue-------
select top 5 pizza_name,count(quantity)as Total_Pizzas_sold from Pizza_Sales
group by pizza_name
order by  total_Pizzas_sold

---Top 5 Pizzas by Quantity-----
select top 5 pizza_name,count(quantity)as Total_Pizzas_Sold from Pizza_Sales
group by pizza_name
order by Total_Pizzas_Sold  desc

----Top 5 Pizzas by Total Orders-----
select top 5 pizza_name,count(distinct order_id)as total_Orders from Pizza_Sales
group by pizza_name 
order by total_Orders desc 

-----Bottom 5 Pizzas by Total Orders--------
select top 5 pizza_name,count(distinct order_id)as Total_No_Orders from Pizza_Sales
group by pizza_name
order by Total_No_Orders asc
