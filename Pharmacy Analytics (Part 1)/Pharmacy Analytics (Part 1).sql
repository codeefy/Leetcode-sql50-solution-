SELECT drug,(total_sales-cogs) as total_profit from pharmacy_sales
order by total_profit DESC
limit 3;
