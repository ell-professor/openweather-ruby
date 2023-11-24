RSpec.describe Importers::Location do

  let(:subject) { Importers::Location.new('Delhi') }

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
      VCR.use_cassette("geocode") do
        subject.call
      end
    end

    it 'imports location data' do
      location = Location.last

      expect(location.name).to eql('Delhi')
      expect(location.state.name).to eql('Delhi')
      expect(location.latlon).not_to be nil
    end
  end
end