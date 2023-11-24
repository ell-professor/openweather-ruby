class ImportAirPollutionDataJob < ApplicationJob
  queue_as :default

  def perform(location_name)
    location = Location.find_by(name: location_name)

    if location.blank?
      # Send error to monitoring service etc and exit the job
      return
    end

    Importers::AirPollutionDatapoint.new(location).call
  end
end
