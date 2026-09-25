with cte as (
select *, clicked*revenue as rev, extract(DAY from impression_time) as day_of_month 
from ad_impressions order by day_of_month asc 
)
-- select max(revenue) from cte group by cast(day_of_month as string) order by cast(day_of_month as string) asc;
select day_of_month, avg(rev) as	avg_revenue, max(revenue) as	max_revenue, Null as	click_premium 
from cte group by cast(day_of_month as INT) order by cast(day_of_month as INT) asc;
