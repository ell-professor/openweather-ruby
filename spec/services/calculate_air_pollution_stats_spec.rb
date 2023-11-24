RSpec.describe CalculateAirPollutionStats do

  let(:location) { create(:location) }
  let(:subject) { CalculateAirPollutionStats.new(location, Date.today) }

  describe '#call' do

    before do
      create(:air_pollution_datapoint, air_quality_index: 2, location: location)
      create(:air_pollution_datapoint, air_quality_index: 4, location: location)
      subject.call!
    end

    context 'New stat' do
      it 'creates air pollution stat' do
        stat = AirPollutionStat.last
  
        expect(stat.location).to eql location
        expect(stat.average_aqi).to eql 3.0
        expect(stat.number_of_datapoints).to eql 2
      end
    end

    context 'Existing stat' do
      let!(:existing_stat) { AirPollutionStat.last }

      before do
        create(:air_pollution_datapoint, air_quality_index: 3, location: location)
      end

      it 'updates air pollution stat' do
        subject.call!
        stat = AirPollutionStat.last

        expect(stat.id).to eql existing_stat.id
        expect(stat.location).to eql location
        expect(stat.average_aqi).to eql 3.0
        expect(stat.number_of_datapoints).to eql 3
      end
    end
  end
end