/*add colum to get matching two letter state data*/

alter table covid_df

add column state2 varchar(2)

update covid_df
set state2 = 
CASE 
WHEN "state" ILIKE 'AK%' OR "state" ILIKE '%alaska%' THEN 'AK'
WHEN "state" ILIKE 'AL%' OR "state" ILIKE '%alabama%' THEN 'AL'
WHEN "state" ILIKE 'AZ%' OR "state" ILIKE '%arizona%' THEN 'AZ'
WHEN "state" ILIKE 'AR%' OR "state" ILIKE '%arkansas%' THEN 'AR'
WHEN "state" ILIKE 'CA%' OR "state" ILIKE '%california%' THEN 'CA'
WHEN "state" ILIKE 'CT%' OR "state" ILIKE '%connecticut%' THEN 'CT'
WHEN "state" ILIKE 'CO%' OR "state" ILIKE '%colorado%' THEN 'CO'
WHEN "state" ILIKE 'DC%' OR "state" ILIKE '%district of columbia%' THEN 'DC'
WHEN "state" ILIKE 'DE%' OR "state" ILIKE '%delaware%' THEN 'DE'
WHEN "state" ILIKE 'FL%' OR "state" ILIKE '%florida%' THEN 'FL'
WHEN "state" ILIKE 'GA%' OR "state" ILIKE '%georgia%' THEN 'GA'
WHEN "state" ILIKE 'HI%' OR "state" ILIKE '%hawaii%' THEN 'HI'
WHEN "state" ILIKE 'IA%' OR "state" ILIKE '%iowa%' THEN 'IA'
WHEN "state" ILIKE 'ID%' OR "state" ILIKE '%idaho%' THEN 'ID'
WHEN "state" ILIKE 'IL%' OR "state" ILIKE '%illinois%' THEN 'IL'
WHEN "state" ILIKE 'IN%' OR "state" ILIKE '%indiana%' THEN 'IN'
WHEN "state" ILIKE 'KS%' OR "state" ILIKE '%kansas%' THEN 'KS'
WHEN "state" ILIKE 'KY%' OR "state" ILIKE '%kentucky%' THEN 'KY'
WHEN "state" ILIKE 'LA%' OR "state" ILIKE '%louisiana%' THEN 'LA'
WHEN "state" ILIKE 'MD%' OR "state" ILIKE '%maryland%' THEN 'MD'
WHEN "state" ILIKE 'ME%' OR "state" ILIKE '%maine%' THEN 'ME'
WHEN "state" ILIKE 'MS%' OR "state" ILIKE '%mississippi%' THEN 'MS'
WHEN "state" ILIKE 'MN%' OR "state" ILIKE '%minnesota%' THEN 'MN'
WHEN "state" ILIKE 'MT%' OR "state" ILIKE '%montana%' THEN 'MT'
WHEN "state" ILIKE 'MO%' OR "state" ILIKE '%missouri%' THEN 'MO'
WHEN "state" ILIKE 'MI%' OR "state" ILIKE '%michigan%' THEN 'MI'
WHEN "state" ILIKE 'MA%' OR "state" ILIKE '%massachusetts%' THEN 'MA'
WHEN "state" ILIKE 'NC%' OR "state" ILIKE '%north carolina%' THEN 'NC'
WHEN "state" ILIKE 'ND%' OR "state" ILIKE '%north dakota%' THEN 'ND'
WHEN "state" ILIKE 'NH%' OR "state" ILIKE '%new hampshire%' THEN 'NH'
WHEN "state" ILIKE 'NJ%' OR "state" ILIKE '%new jersey%' THEN 'NJ'
WHEN "state" ILIKE 'NM%' OR "state" ILIKE '%new mexico%' THEN 'NM'
WHEN "state" ILIKE 'NV%' OR "state" ILIKE '%nevada%' THEN 'NV'
WHEN "state" ILIKE 'NY%' OR "state" ILIKE '%new york%' THEN 'NY'
WHEN "state" ILIKE 'NE%' OR "state" ILIKE '%nebraska%' THEN 'NE'
WHEN "state" ILIKE 'OH%' OR "state" ILIKE '%ohio%' THEN 'OH'
WHEN "state" ILIKE 'OK%' OR "state" ILIKE '%oklahoma%' THEN 'OK'
WHEN "state" ILIKE 'OR%' OR "state" ILIKE '%oregon%' THEN 'OR'
WHEN "state" ILIKE 'PA%' OR "state" ILIKE '%pennsylvania%' THEN 'PA'
WHEN "state" ILIKE 'RI%' OR "state" ILIKE '%rhode island%' THEN 'RI'
WHEN "state" ILIKE 'SC%' OR "state" ILIKE '%south carolina%' THEN 'SC'
WHEN "state" ILIKE 'SD%' OR "state" ILIKE '%south dakota%' THEN 'SD'
WHEN "state" ILIKE 'TN%' OR "state" ILIKE '%tennessee%' THEN 'TN'
WHEN "state" ILIKE 'TX%' OR "state" ILIKE '%texas%' THEN 'TX'
WHEN "state" ILIKE 'UT%' OR "state" ILIKE '%utah%' THEN 'UT'
WHEN "state" ILIKE 'VT%' OR "state" ILIKE '%vermont%' THEN 'VT'
WHEN "state" ILIKE 'WA%' OR "state" ILIKE '%washington%' THEN 'WA'
WHEN "state" ILIKE 'WI%' OR "state" ILIKE '%wisconsin%' THEN 'WI'
WHEN "state" ILIKE 'WV%' OR "state" ILIKE '%west virginia%' THEN 'WV'
WHEN "state" ILIKE 'WY%' OR "state" ILIKE '%wyoming%' THEN 'WY'
WHEN "state" ILIKE 'VA%' OR "state" ILIKE '%virginia%' THEN 'VA'
ELSE '' END AS "State2"
 ;

/**/

select * from covid_df 
 
order by date limit(100)
 ;



select * from covid_by_day

select sum(value), avg(value) from covid_by_day

 /*2729.2815356489945155*/
 
 
select count(*) as average, start_time into accidents_by_day from accident_df 
group by start_time

 select avg(average) , date_part( 'year', start_time) from  accidents_by_day
 group by date_part('year',start_time)


select * from accident_df limit(100)