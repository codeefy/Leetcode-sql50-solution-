SELECT p.page_id
FROM pages p
left outer join page_likes pl on p.page_id=pl.page_id
where pl.page_id is NULL
order by p.page_id;


--- Alternative Solution using subquery 
SELECT page_id
FROM pages
WHERE page_id NOT IN (SELECT page_id FROM page_likes)
ORDER BY page_id;
