-- HackerRank Problem: Occupations
-- SQL Solution
-- By: Celia Chen

set @d=0, @p=0, @s=0, @a=0;

select min(D), min(P), min(S), min(A)
from(
  select case 
            when Occupation='Doctor' then (@d:=@d+1)
            when Occupation='Professor' then (@p:=@p+1)
            when Occupation='Singer' then (@s:=@s+1)
            when Occupation='Actor' then (@a:=@a+1) 
            end as n_row,
        case when Occupation='Doctor' then Name end as D,
        case when Occupation='Professor' then Name end as P,
        case when Occupation='Singer' then Name end as S,
        case when Occupation='Actor' then Name end as A
  from OCCUPATIONS
  order by Name
) as temp
group by n_row;