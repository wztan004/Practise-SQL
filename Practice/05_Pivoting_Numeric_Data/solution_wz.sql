select Category
, sum(case when EXTRACT(month from time) = 3 then cost else 0 end) as Mar
, sum(case when EXTRACT(month from time) = 2 then cost else 0 end) as Feb
, sum(case when EXTRACT(month from time) = 1 then cost else 0 end) as Jan
from Expenses
group by 1
order by category ;