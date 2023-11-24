RSpec.describe CalculateAirPollutionStatsJob do
  let(:location) { create(:location) }
  let(:subject) { CalculateAirPollutionStatsJob }

  it 'enqueues the job in default queue' do
    expect { CalculateAirPollutionStatsJob.perform_later }.to have_enqueued_job(CalculateAirPollutionStatsJob).on_queue('default')
  end

  context 'When location is found' do
    after do
      subject.perform_now(location.name, Date.today)
    end

    it 'calls CalculateAirPollutionStats service' do
      expect_any_instance_of(CalculateAirPollutionStats).to receive(:call!)
    end
  end

  context 'When location is not found' do
    after do
      subject.perform_now('Non Existing Location', Date.today)
    end

    it 'calls CalculateAirPollutionStats service' do
      expect_any_instance_of(CalculateAirPollutionStats).not_to receive(:call!)
    end
  end
end
