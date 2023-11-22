module OpenWeather
  class Error
    CUSTOM_ERROR_MAP = {}

    # Placeholder for custom errors
    def self.map_error(e)
      raise custom_error(e) || e
    end

    # TODO: Implement
    def self.custom_error(e)
      CUSTOM_ERROR_MAP[e]
    end
  end
end