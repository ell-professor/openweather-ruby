module OpenWeather
  class Client
    BASE_URL = 'http://api.openweathermap.org/'.freeze

    def air_pollution_data(lat, lon)
      params = { lat: lat, lon: lon }
      request('data/2.5/air_pollution', params: params)
    end

    def air_pollution_history(lat, lon, start_range, end_range)
      params = { lat: lat, lon: lon, start: start_range, end: end_range }
      request('data/2.5/air_pollution/history', params: params)
    end

    def geocode(location)
      params = { q: location, limit: 1 }
      request('geo/1.0/direct', params: params)
    end

    private

    def request(endpoint, action: :get, params: {})
      response = RestClient::Request.execute(url: BASE_URL + endpoint, method: action, headers: { params: params.merge(appid: appid) })
      JSON.parse(response.body)
    
    rescue StandardError => e
      Error.map_error(e)
    end

    def appid
      ENV['OPEN_WEATHER_APP_ID']
    end
  end
end
