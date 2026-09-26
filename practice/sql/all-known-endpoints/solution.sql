WITH cte AS(SELECT DISTINCT endpoint FROM api_calls UNION SELECT DISTINCT b.endpoint FROM rate_limits b)


,cte3 as (
SELECT 
   CASE WHEN SUBSTR(endpoint,  1,  12) = '/api/v1/auth' THEN '/api/v1/auth' 
WHEN SUBSTR(endpoint,1,12) = '/api/v2/auth' THEN '/api/v2/auth' 
when substr(endpoint,len(endpoint))='/' then substr(endpoint,1,len(endpoint)-1)
else endpoint end as endpoint,
 Case
WHEN SUBSTR(endpoint,1,8) = '/api/v1/' THEN replace(endpoint,'/','')
 WHEN SUBSTR(endpoint,1,8) = '/api/v2/' THEN replace(endpoint,'/','')
 end AS api1
FROM cte )

select distinct 
-- case when substr(endpoint,len(endpoint))='/' then substr(endpoint,1,len(endpoint)-1)
-- else 
  -- endpoint end as 
  endpoint  from cte3 order by api1 asc;
