require 'weather_client'
require 'location'
require 'forecast'

class WeatherService
# This calls the weather api client and saves the 48 hour data into the database

  def initialize
    @client = WeatherClient.new
  end

  def forecasts location
    # Create new forecast object 48hr data
    forecasts = @client.get city.lat, city.lon
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
        created_at:        Time.now,
        updated_at:        Time.now
      }
    end
  end 
end



