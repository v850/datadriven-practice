





with cte as (
select svc_name , min(uptime) as uptime from svc_health group by svc_name ) 

select svc_name, min_uptime from(
select svc_name, uptime as min_uptime , dense_rank() over(partition by svc_name order by uptime asc) 
as rnk 
from cte )a where rnk<=10 order by min_uptime asc limit 10;
