module Importers
  class Base

    def call
      raw_data = data_provider.new.public_send(action, *fetch_params)
      transformed_data = mapper.new(raw_data).call
      writer.new(transformed_data, *import_params).call!
    end

    protected

    def data_provider
      OpenWeather::Client
    end

    def mapper
      raise NotImplementedError
    end

    def fetch_data
      raise NotImplementedError
    end

    def fetch_params
      []
    end

    def import_params
      []
    end
  end
end