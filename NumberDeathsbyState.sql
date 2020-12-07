declare
@startdate = '2020-01-01'
@enddate = '2020-12-31'
@currentdate = @startdate

create temp table coviddays
(
	date date,
	county varchar(60),
	state2 varchar(2)
	deaths int,
	NewDeaths int
	
)


while @currentdate <= @enddate
begin
insert into coviddays 
select @currentdate,
county,
state2,




/*declare

@startddate = '2020-01-01'
@enddate = '2020-12-01' 
@CURRENTdate = @startdate
 


SELECT  INTO date number OF widgets INTO temptable

WHILE @CURRENTdate <= @endate
BEGIN 
INSERT INTO temptable
SELECT @currentdate =date column

(SELECT sum(deaths), FROM datatable
WHERE date <= @current

SET @currentdate = DATEADD(DAY,1,@currentdate)
end*/

date,county,state,cases,deaths,state2


date,county,state2,deaths,newdeaths

create table #TheirTable(
date datetime null,
county char(30) null,
state char(30) null,
cases int null,
deaths int null,
state2 char(2) null
)



delete from #TheirTable

insert into #TheirTable(
date,
county,
state,
cases,
deaths,
state2)
select convert(datetime,'2020-03-21'),'snohomish','washington',446,9,'WA'
union
select convert(datetime,'2020-03-22'),'snohomish','washington',446,10,'WA'
union
select convert(datetime,'2020-03-24'),'snohomish','washington',446,15,'WA'
union
select convert(datetime,'2020-03-25'),'snohomish','washington',446,16,'WA'
union
select convert(datetime,'2020-03-22'),'moria','middle earth',446,9,'WA'
union
select convert(datetime,'2020-03-25'),'moria','middle earth',446,10,'WA'
union
select convert(datetime,'2020-03-27'),'moria','middle earth',446,15,'WA'
union
select convert(datetime,'2020-03-28'),'moria','middle earth',446,16,'WA'


create table Coviddays(
date datetime null,
county char(30) null,
state2 char(30) null,
deaths int null,
newdeaths int null
)


declare @startdate datetime
declare @enddate datetime
declare @currentdate datetime
set @startdate = (select min(date) from #TheirTable with (nolock))
set @enddate = (select max(date) from #TheirTable with (nolock))
set @currentdate = @startdate

select distinct county,state2 into #statecountylist from #TheirTable

/* loop through every possible day, including end date */
While @currentdate <= @enddate
begin
   /* insert all rows for all counties and all states that have the current date...all at once */
   insert into coviddays(date,county,state2,deaths,newdeaths)
   select
   date = @currentdate,
   county = #statecountylist.county,
   state2 = #statecountylist.state2,
   deaths = case
            when #TheirTable.deaths is not null
             then #TheirTable.deaths
             else IsNull((select top 1 IsNull(previousday.deaths,0)
                from #TheirTable previousday with (nolock)
                where previousday.date < @currentdate
                and previousday.county = #statecountylist.county
                and previousday.state2 = #statecountylist.state2
                order by previousday.date desc),0)
            end,
   newdeaths = 0
   from #statecountylist with (nolock)
   left outer join #TheirTable with (nolock)
   on #TheirTable.date = @CurrentDate
   and #TheirTable.county = #statecountylist.county
   and #TheirTable.state2 = #statecountylist.state2

   /* advance to next day */
   set @currentdate = dateadd(day,1,@currentdate)
end
update coviddays set
NewDeaths = deaths - case
   when exists (select top 1 1
                from coviddays previouscovidday with (nolock)
                where previouscovidday.date < coviddays.date
                and previouscovidday.county = coviddays.county
                and previouscovidday.state2 = coviddays.state2)
    then IsNull((select top 1 IsNull(previouscovidday2.deaths,0)
                from #TheirTable previouscovidday2 with (nolock)
                where previouscovidday2.date < coviddays.date
                and previouscovidday2.county = coviddays.county
                and previouscovidday2.state2 = coviddays.state2
                order by previouscovidday2.date desc),0)
    else (select 0)
    end
drop table #statecountylist



select * from Coviddays
order by state2,county,date


delete from coviddays
