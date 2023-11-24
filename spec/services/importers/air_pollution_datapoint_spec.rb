RSpec.describe Importers::AirPollutionDatapoint do
  
  let(:location) { create(:location) }
  let(:subject) { Importers::AirPollutionDatapoint.new(location) }

  it 'has a mapper' do
    expect(subject.mapper).not_to be nil
  end

  it 'has a writer' do
    expect(subject.writer).not_to be nil
  end

  it 'has a data provider' do
    expect(subject.send(:data_provider)).not_to be nil
  end

  it 'has a action' do
    expect(subject.action).not_to be nil
  end

  describe '#call' do
    before do
      VCR.use_cassette("air_pollution_data") do
        subject.call
      end
    end

    it 'imports air pollution data' do
      data_point = AirPollutionDatapoint.last

      expect(data_point.location).to eql(location)
      expect(data_point.air_quality_index).not_to be nil
    end
  end
end