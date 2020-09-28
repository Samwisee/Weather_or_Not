require 'weather_client'
require 'location'
require 'forecast'

class WeatherService

  def update_forecasts
    # retrieve a list of cities from the DB
    cities = Location.all

    # for each city, retrieve 48 hours of forecasts
    client = WeatherClient.new
    cities.each do |city|
      # write hourly forecasts to the DB
      Forecast.create forecasts(client, city)
    end
  end

  private

  def forecasts client, city
    forecasts = client.get city.lat, city.lon
    forecasts.map do |forecast|
      {
        dt:                forecast[:dt],
        temp:              forecast[:temp],
        feels_like:        forecast[:feels_like],
        wind_speed:        forecast[:wind_speed],
        rain:              forecast[:rain],
        short_description: forecast[:short_description],
        long_description:  forecast[:long_description],
        location_id:       city[:id],
      }
    end
  end 
end
