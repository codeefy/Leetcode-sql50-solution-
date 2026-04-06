SELECT users.city, 
  COUNT(trades.order_id) AS total_orders
FROM trades 
JOIN users
ON trades.user_id = users.user_id 
WHERE trades.status = 'Completed'
GROUP BY users.city
order by total_orders DESC
limit 3;

