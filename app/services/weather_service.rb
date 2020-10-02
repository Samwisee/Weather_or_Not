require 'weather_client'
require 'location'
require 'forecast'

class WeatherService
# This calls the weather api client and saves the 48 hour data into the database

  def update_forecasts
    # TODO: retrieve a list of cities from the DB
    cities = Location.all

    # for each city, retrieve 48 hours of forecasts
    client = WeatherClient.new
    cities.each do |city|
      # write hourly forecasts to the DB
      #TODO doesn't work because new ids are assigned on api call so old forecasts do not get 
      Forecast.upsert_all(forecasts(client, city)) # unique_by: :dt
    end
  end

  private

  def forecasts client, city
    # Create new forecast object 48hr data
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
        created_at:        Time.now,
        updated_at:        Time.now
      }
    end
  end 
end



