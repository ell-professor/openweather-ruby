module OpenWeather
  module Mappers
    class Geocode
      attr_reader :payload

      FILEDS_TO_MAP = %w(name lat lon state)

      def initialize(payload)
        @payload = payload[0].with_indifferent_access
      end

      def call
        payload.slice(*FILEDS_TO_MAP)
      end
    end
  end
end
