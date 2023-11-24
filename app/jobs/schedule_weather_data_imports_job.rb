class ScheduleWeatherDataImportsJob < ApplicationJob
  queue_as :default

  def perform
    Location.pluck(:name).each do |location_name|
      ImportAirPollutionDataJob.perform_later(location_name)
    end
  end
end
