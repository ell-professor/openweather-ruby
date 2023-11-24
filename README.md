# README

## OpenWeather API Integration

This demo application integrates three open weather api endpoints :
- Air Pollution Data
- Air Pollution History
- Geocoding

## Architecture
- **Importers** :
    - Fetch data from a data provider.
    - Tranforms the data to X format using mappers.
    - Pass the data to corresponding writer.
    - This layer does not interacts with the data and is provider agnostic.
- **Writers** :
    - Takes Data in X format.
    - Writes to Database.
- **Api Integrations** :
    - Client (Data Provider) : Fetches data from API
    - Mappers : Transform API data to X format.
- **Jobs**
    - ImportAirPollutionDataJob : Fetch data from API and store in DB.
    - CalculateAirPollutionStatsJob : Calculate stats for stored air pollution data.
    - ScheduleWeatherDataImportsJob : Runs periodically and schedule ImportAirPollutionDataJob for each location.
    - ScheduleCalculateStatsJob : Runs periodically and schedule CalculateAirPollutionStatsJob for each location.

#### Note : To integrate a new weather data provider only new data provider and mapper classes need to be implemented.

## Setup
- **Dependencies**
    - Postgresql
    - Postgis
    - OpenWeather API Key 
    - Run `cp .env_template .env` and set your API key
- **Steps**

    ```
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed
    ```
- **Schedule cron jobs**
    - `whenever --update-crontab --set environment=development`

 ## Playground
 - Fire up `rails console`

 - Use `QueriesUtility` class to run queries to get stats.
    - average_aqi_per_location_per_month
    - average_aqi_per_location
    - average_aqi_per_state
- Before running the queries, please ensure `AirpollutionStat`` reocords are populated.