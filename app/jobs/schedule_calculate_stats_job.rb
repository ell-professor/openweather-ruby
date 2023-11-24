class ScheduleCalculateStatsJob < ApplicationJob
  queue_as :default

  def perform
    date = Date.yesterday

    Location.pluck(:name).each do |location_name|
      CalculateAirPollutionStatsJob.perform_later(location_name, date)
    end
  end
end
