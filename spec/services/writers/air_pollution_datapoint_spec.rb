RSpec.describe Writers::AirPollutionDatapoint do
  
  let(:location) { create(:location) }
  let(:data) { YAML.load(IO.binread('spec/fixtures/writers/air_pollution_datapoint.yml')).with_indifferent_access }
  let(:subject) { Writers::AirPollutionDatapoint.new(data, location) }

  describe '#call' do

    it 'creates air pollution datapoint record' do
      subject.call!
      data_point = AirPollutionDatapoint.last

      expect(data_point.location).to eql location
      expect(data_point.air_quality_index).to eql 'good'
      expect(data_point.co).to eql data[:co]
      expect(data_point.no).to eql data[:no]
      expect(data_point.no2).to eql data[:no2]
      expect(data_point.o3).to eql data[:o3]
      expect(data_point.so2).to eql data[:so2]
      expect(data_point.pm2_5).to eql data[:pm2_5]
      expect(data_point.pm10).to eql data[:pm10]
      expect(data_point.nh3).to eql data[:nh3]
    end
  end
end