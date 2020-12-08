/*a review oif the data for explanations, 
analyses and possible treends to discuss*/

select * from covid_by_day
where date ='2020-07-27'
select sum(value), avg(value) from covid_by_day

 --2729.2815356489945155
select count(*) as average, start_time into accidents_by_day from accident_df 
group by start_time

 select avg(average) , date_part( 'year', start_time) from  accidents_by_day
 group by date_part('year',start_time)
 
 select max(date) from coviddays
 
 
 
 2020-09-26
 select sum (newdeaths) from coviddays
 where state2 not in ('PR','VI','GU','mp')
 and date ='2020-07-27'
 205,659
 
 select * from coviddays   
 where date between '2020-07-01' and '2020-07-15'
 and state2 = 'NY'
 
 select * from accidents_by_day
 order by start_time
 
  where start_time between '2020-07-01' and '2020-07-15'
  
  
 select date, sum(newdeaths) as CovidDeaths, cd.state2, average, start_time from accidents_by_day cd 
 join coviddays ad on ad.start_time = cd.date
 where cd.state2 = 'NY' and cd.date between '2020-05-01' and '2020-05-15'
 group by cd.date, cd.newdeaths, cd.state2, ad.average, ad.start_time