create index  test on test.many(check1); 
explain analyze select * from test.many where check1>1000;
explain analyze select * from test.many where ccount>1000;
truncate company.location;


#clustered index 걸린 것과 index 안 걸린 것의 select 속도 차이 비교
explain analyze select no from company.location where no>=50000;

explain analyze select count from company.location where count>=50000;

create index company on location(count);

#non-clustered index 화 하여 시간 측정
explain analyze select count from company.location where count>=50000;


#where 문의 조건상에서 index 가 걸린 것과 안걸린 것의 차이점 비교

#where 조건문에 index 가 걸린 얘들
explain analyze select *
from department as d, employee as e
where e.no=d.no and e.no>=15000;

#where 조건문에 index가 안걸린 얘들
explain analyze select *
from department as d, employee as e
where e.count=d.no and e.count>=15000;

select *
from department as d, employee as e
where e.no=d.no and e.no>=15000;


select *
from department as d, employee as e
where e.count=d.no and e.count>=15000;

