RSpec.describe ScheduleWeatherDataImportsJob do
  let(:subject) { ScheduleWeatherDataImportsJob }

  it 'enqueues the job in default queue' do
    expect { ScheduleWeatherDataImportsJob.perform_later }.to have_enqueued_job(ScheduleWeatherDataImportsJob).on_queue('default')
  end

  it 'Enqueues CalculateAirPollutionStatsJob for each location' do
    location = create(:location)
    expect { subject.new.perform }.to have_enqueued_job(ImportAirPollutionDataJob).on_queue('default').with(location.name)
  end
end
