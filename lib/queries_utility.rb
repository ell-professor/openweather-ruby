class QueriesUtility
  class << self

    def average_aqi_per_location_per_month
      AirPollutionStat.joins(:location)
        .order('locations.name', :year, :month)
        .pluck('locations.name', :year, :month, :average_aqi)
    end

    def average_aqi_per_location
      AirPollutionStat.joins(:location)
        .group('locations.name')
        .order('locations.name')
        .pluck(Arel.sql('locations.name, sum(average_aqi * number_of_datapoints) / sum(number_of_datapoints)'))
    end

    def average_aqi_per_state
      AirPollutionStat.joins(location: :state)
        .group('states.name')
        .order('states.name')
        .pluck(Arel.sql('states.name, sum(average_aqi * number_of_datapoints) / sum(number_of_datapoints)'))
    end
  end
end
