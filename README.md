# <div align = "center"> ETL_Trafic_and_Covid </div>
## <div align = "center"> Exploring relationships between traffic accidents and Covid-19 pandemic. </div>
![cover_art.png](pictures/covid_transport.png)
### <div align= "center"> Goal </div>
We are looking at traffic accident data from January 21st, 2020 to June 2020 and comparing it to Covid data, to see if the proliferation of the virus has had an effect on traffic accidents due to the various shutdowns put into place. Our expectation is that when these measures are put into place, Traffic accidents will decrease. 

#### <div align = "center"> Sources </div>
  
  1. [Accident Information](https://www.kaggle.com/sobhanmoosavi/us-accidents?select=US_Accidents_June20.csv)
     - This is a countrywide car accident dataset, which covers 49 states of the USA. The accident data are collected from February 2016 to June 2020, using two APIs that provide streaming traffic incident (or event) data. These APIs broadcast traffic data captured by a variety of entities, such as the US and state departments of transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. Currently, there are about 3.5 million accident records in this dataset.
     - US_Accidents_June20.csv
     - Kaggle
     - 1.24 gb
     - Columns: ID, Start Time, City, County, State
  2. [Covid Data](https://www.kaggle.com/sudalairajkumar/covid19-in-usa)
     - Data is obtained from COVID-19 Tracking project and NYTimes. Sincere thanks to them for making it available to the public. Coronaviruses are a large family of viruses which may cause illness in animals or humans. In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19. This dataset has information from 50 US states and the District of Columbia at daily level.
     - us_counties_covid19_daily.csv
     - Kaggle
     - 7 mb
     - Columns: Deaths, Time, City, State

#### <div align = "center"> Tasks </div>
  - [x] Create Repository
  - [x] Create Slack Channel
  - [x] Pare down Accident Database in Pandas, as size prevents uploading to Github, then upload this to the Github
    - [x] Remove Unneeded columns and dates and create new CSV with only relevant data
  - [x] Convert CSV's to Dataframes
    - [x] Normalize Timestamps in both Dataframes to only include YYYY-MM-DD
  - [ ] Create SQL Database
  - [ ] Manipulate data with Pandas (Data Cleaning)
  - [ ] Plot anything we need to plot.
  - [ ] Move data to SQL

#### <div align = "center"> Replication Steps </div>
1. Download Full CSV's
2. Run Python
