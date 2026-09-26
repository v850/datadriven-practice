WITH cte AS(
select distinct user_id ,
 extract(year FROM session_start) * 100 + extract(month FROM session_start) AS year_mon
  FROM user_sessions )
--  row_number() over(partition by  (extract(year from session_start)*100+ extract(month from session_start)) 
-- ,user_id ) as rnk

 
  select distinct user_id from (
 select *, row_number() over(partition by user_id order by year_mon desc) as rnk from cte
)a where rnk>=3 order by user_id;
