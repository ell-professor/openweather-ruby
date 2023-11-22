module Writers
  class Location
    attr_reader :raw_data, :params

    def initialize(raw_data, params = {})
      @raw_data = raw_data
      @params = params
    end

    def call!
      location = ::Location.find_or_initialize_by(name: raw_data[:name])
      location.state = State.find_or_create_by(name: raw_data[:state])
      location.latlon = RGeo::Geographic.spherical_factory(srid: 4326).point(raw_data[:lat], raw_data[:lon])
      location.save!
    end
  end
end
