/* 
  This SQL was to =loop through the coavid data, which was using a 
  cumlative figure for the nunmber of deaths, and placing a new column 
  to accertain a detahs per day
*/
 
 
 
create table Coviddays(
date date null,
county char(30) null,
state2 char(2) null,
deaths int null,
newdeaths int null
)

--drop table statecountylist

create temp table statecountylist
(county varchar(60),
state2 varchar(2))

insert into statecountylist 
select distinct county,state2  from covid_df


-- declare
--    counter    integer := 1;
--    first_name varchar(50) := 'John';
--    last_name  varchar(50) := 'Doe';
--    payment    numeric(11,2) := 20.5;

DO $$
DECLARE
 startdate   date := (select min(date) from covid_df );
 enddate     date := (select max(date) from covid_df );
 currentdate date := startdate;
 
 

/* loop through every possible day, including end date */


	begin
	
		While currentdate <= enddate 
	loop
   /* insert all rows for all counties and all states that have the current date...all at once */
   insert into coviddays(date,county,state2,deaths,newdeaths)
   select
   date = currentdate,
   county = statecountylist.county,
   state2 = statecountylist.state2,
   deaths = case
            when covid_df.deaths is not null
             then covid_df.deaths
             else COALESCE((select COALESCE(previousday.deaths,0)  
                from covid_df previousday 
                where previousday.date < currentdate
                and previousday.county = statecountylist.county
                and previousday.state2 = statecountylist.state2
                order by previousday.date desc limit 1),0)
            end
	,   newdeaths = 0
   from statecountylist 
   left outer join covid_df 
   on covid_df.date = currentdate
   and covid_df.county = statecountylist.county
   and covid_df.state2 = statecountylist.state2

   /* advance to next day */
   set currentdate = dateadd(day,1,currentdate)
end  
update coviddays set
NewDeaths = deaths - case
   when exists (select * --limt 1 here or below
                from coviddays previouscovidday 
                where previouscovidday.date < coviddays.date
                and previouscovidday.county = coviddays.county
                and previouscovidday.state2 = coviddays.state2
			   limit 1)
    then COALESCE((select COALESCE(previouscovidday2.deaths,0)
                from covid_df previouscovidday2 
                where previouscovidday2.date < coviddays.date
                and previouscovidday2.county = coviddays.county
                and previouscovidday2.state2 = coviddays.state2
                order by previouscovidday2.date desc limit 1),0)
    else (select 0)
	
	end 
	
	end loop

end $$;  

--drop table #statecountylist



-- select * from Coviddays
-- order by state2,county,date


-- delete from coviddays
