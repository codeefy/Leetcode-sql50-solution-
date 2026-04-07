select manufacturer,count(drug) as drug_count,sum(cogs-total_sales) as total_loss
from pharmacy_sales
WHERE total_sales-cogs<=0
group by manufacturer
order by total_loss DESC;

