RSpec.describe OpenWeather::Client do
  
  let(:client) { OpenWeather::Client.new }

  describe '#air_pollution_data' do
    let(:response) do
      VCR.use_cassette("air_pollution_data") do
        client.air_pollution_data(50.0, 50.0)
      end
    end

    it 'fetches data for requested coordinates' do
      expect(response['coord']['lat']).to eql(50)
      expect(response['coord']['lon']).to eql(50)
    end

    it 'fetches air pollution data' do
      data = response['list'][0]

      expect(data['main'].keys).to eql(['aqi'])
      expect(data['components'].keys).to include(*%w(co no no2 o3 so2 pm2_5 pm10 nh3))
    end
  end

  describe '#air_pollution_history' do
    let(:response) do
      VCR.use_cassette("air_pollution_history") do
        client.air_pollution_history(50, 50, 1606223802, 1606482999)
      end
    end

    it 'fetches data for requested coordinates' do
      expect(response['coord']['lat']).to eql(50)
      expect(response['coord']['lon']).to eql(50)
    end
  end

  describe '#geocode' do
    let(:response) do
      VCR.use_cassette("geocode") do
        response = client.geocode('Delhi')
      end
    end

    it 'fetches data for requested location' do
      expect(response[0]['name']).to eql 'Delhi'
    end

    it 'fetches lat lon data' do
      expect(response[0].keys).to include(*%w(name lat lon state))
    end
  end
end