module Importers
  class Location < Base
    attr_reader :location_name

    def initialize(location_name)
      @location_name = location_name
    end

    def writer
      Writers::Location
    end

    def mapper
      OpenWeather::Mappers::Geocode
    end

    def action
      :geocode
    end

    def fetch_params
      [location_name]
    end
  end
end
