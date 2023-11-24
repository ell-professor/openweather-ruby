RSpec.describe AirPollutionDatapoint, type: :model do
  let(:subject) { create(:air_pollution_datapoint) }

  it 'should validate the presence of air quality index' do
    subject.air_quality_index = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of recorded date' do
    subject.recorded_at = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
end