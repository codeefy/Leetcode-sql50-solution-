select sender_id ,count(*) as message_count
from messages 
where sent_date BETWEEN '08/01/2022 00:00:00' and '08/30/2022 23:59:59'
group by sender_id
order by message_count DESC
limit 2
