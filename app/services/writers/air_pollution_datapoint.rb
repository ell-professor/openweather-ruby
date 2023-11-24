module Writers
  class AirPollutionDatapoint
    attr_reader :raw_data, :location

    def initialize(raw_data, location)
      @raw_data = raw_data
      @location = location
    end

    def call!
      data_point = location.air_pollution_datapoints.new(raw_data)
      data_point.recorded_at = Time.zone.now
      data_point.save!
    end
  end
end