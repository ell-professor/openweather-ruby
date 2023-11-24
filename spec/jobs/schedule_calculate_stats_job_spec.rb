RSpec.describe ScheduleCalculateStatsJob do
  let(:subject) { ScheduleCalculateStatsJob }

  it 'enqueues the job in default queue' do
    expect { ScheduleCalculateStatsJob.perform_later }.to have_enqueued_job(ScheduleCalculateStatsJob).on_queue('default')
  end

  it 'Enqueues CalculateAirPollutionStatsJob for each location' do
    location = create(:location)
    expect { subject.new.perform }.to have_enqueued_job(CalculateAirPollutionStatsJob).on_queue('default').with(location.name, Date.yesterday)
  end
end
