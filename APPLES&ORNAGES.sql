SELECT sale_date, sum(
    (CASE
    when fruit = 'apples' then sold_num
    when fruit = 'oranges' then -sold_num
    else 0
    END
    )) as diff
from sales
group by sale_date