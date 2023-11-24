module Importers
  class AirPollutionDatapoint < Base
    attr_reader :location

    def initialize(location)
      @location = location
    end

    def writer
      Writers::AirPollutionDatapoint
    end

    def mapper
      OpenWeather::Mappers::AirPollutionData
    end

    def action
      :air_pollution_data
    end

    def fetch_params
      [location.latlon.lat, location.latlon.lon]
    end

    def import_params
      [location]
    end
  end
end