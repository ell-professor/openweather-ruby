RSpec.describe AirPollutionStat, type: :model do
  let(:subject) { create(:air_pollution_stat) }

  it 'should validate the presence of average air quality index' do
    subject.average_aqi = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of month' do
    subject.month = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of year' do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of number of datapoints' do
    subject.number_of_datapoints = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the presence of location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the uniqueness of location, month and year' do
    subject.save
    new_stat = subject.dup
    expect(new_stat).to_not be_valid
  end
end