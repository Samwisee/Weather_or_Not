class ConvertCity
    def self.call
        lat = current_user.latitude
        lon = current_user.longitude
        data = Weather.call(lat, lon)
        @forecast = Forecast.new(data)
    end
end