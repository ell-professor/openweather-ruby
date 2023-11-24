class CalculateAirPollutionStats
  attr_reader :location, :date

  def initialize(location, date)
    @location = location
    @date = date
  end

  # - Could be modified to calculate all kinds of stats including average amount of components etc.
  # - number_of_datapoints could be used while recalculation of stats for new datapoints but a better approach would be
  #   to calculate using SQL queries and shift data to an archive table or discard from air_pollution_datapoints
  def call!
    table = AirPollutionDatapoint.arel_table

    average_aqi, number_of_datapoints = AirPollutionDatapoint.where(location: location, recorded_at: date.all_month).pluck(table[:air_quality_index].average, table[:id].count).last
    return if average_aqi.blank?

    stat = location.air_pollution_stats.find_or_initialize_by(month: date.month, year: date.year)
    stat.assign_attributes(average_aqi: average_aqi, number_of_datapoints: number_of_datapoints)
    stat.save!
  end
end
