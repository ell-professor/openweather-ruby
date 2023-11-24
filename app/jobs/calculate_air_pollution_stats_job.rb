class CalculateAirPollutionStatsJob < ApplicationJob
  queue_as :default

  def perform(location_name, date)
    location = Location.find_by(name: location_name)

    if location.blank?
      # Send error to monitoring service etc and exit the job
      return
    end

    CalculateAirPollutionStats.new(location, date).call!
  end
end
