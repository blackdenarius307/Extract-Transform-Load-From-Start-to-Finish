# <div align = "center"> ETL_Traffic_and_Covid </div>
## <div align = "center"> Exploring relationships between traffic accidents and Covid-19 pandemic. </div>
![cover_art.png](pictures/covid_transport.png)
### <div align= "center"> Goal </div>
We are examining traffic accident data for the state of New York from May 1st, 2020 to May 15th, 2020 and comparing it to Covid fatality data in the same area and time to gauge whether or not short term severe virus activity (deaths) resulted in any short term shifts in traffic accident occurrence. 
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
  - [x] Create SQL Database
  - [x] Move data to SQL
  - [x] Manipulate data
    - [x] Created new column in Covid dataframe to add 2 letter State abbreviations.
    - [x] Group by dates in both dataframes
  - [ ] Plot both deaths and accidents versus date in their own plots respectively


#### <div align = "center"> Replication Steps </div>
1. Download Full CSV's fro sources above.
2. Run AccidentData.ipynb to pare down Accident Data to a usable data size
3. Run DataTransform.ipynb to transform dates in both CSV's to the proper format
4. Run CreateTablesETL.sql in postgres
5. Import accident_data_new.csv and us_counties_covid19_daily.csv into accident_df and covid_df respectively
6. Run transformSQL.sql for covid_df to create a column with 2 letter state abbreviations.
7. transformSQL.sql adds in a column that calculates new deaths per day as well. This was necessary for our purposes.
8. Run first 4 cells of plotsSQL.ipynb to abbreviate data in both dataframes to the timeframes we are charting. This will generate 2 CSV's for use in plotting.
