module OpenWeather
  module Mappers
    class AirPollutionData
      attr_reader :payload

      FILEDS_TO_MAP = %w(co no no2 o3 so2 pm2_5 pm10 nh3)

      def initialize(payload)
        @payload = payload.with_indifferent_access
      end

      # Return Predefined AirPollutionDataPoint Format
      def call
        data = {}

        data[:air_quality_index] = payload[:list][0][:main][:aqi]

        FILEDS_TO_MAP.each do |field|
          data[field] = payload[:list][0][:components][field]
        end

        data
      end
    end
  end
end