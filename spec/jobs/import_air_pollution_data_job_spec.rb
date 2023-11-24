RSpec.describe ImportAirPollutionDataJob do
  let(:location) { create(:location) }
  let(:subject) { ImportAirPollutionDataJob }

  it 'enqueues the job in default queue' do
    expect { ImportAirPollutionDataJob.perform_later }.to have_enqueued_job(ImportAirPollutionDataJob).on_queue('default')
  end

  context 'When location is found' do
    after do
      subject.perform_now(location.name)
    end

    it 'calls CalculateAirPollutionStats service' do
      expect_any_instance_of(Importers::AirPollutionDatapoint).to receive(:call)
    end
  end

  context 'When location is not found' do
    after do
      subject.perform_now('Non Existing Location')
    end

    it 'calls CalculateAirPollutionStats service' do
      expect_any_instance_of(Importers::AirPollutionDatapoint).not_to receive(:call)
    end
  end
end
