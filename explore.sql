

select * from covid_by_day

select sum(value), avg(value) from covid_by_day

 2729.2815356489945155
select count(*) as average, start_time into accidents_by_day from accident_df 
group by start_time

 select avg(average) , date_part( 'year', start_time) from  accidents_by_day
 group by date_part('year',start_time)