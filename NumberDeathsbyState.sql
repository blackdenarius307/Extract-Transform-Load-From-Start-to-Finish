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

