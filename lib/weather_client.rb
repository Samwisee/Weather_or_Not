require 'json'
require 'open-uri'

class WeatherClient

  def get lat, lon 
    # Set up open weather constants
    api_key = ENV['OPENWEATHER_KEY'] #TODO remove, add to .env
    url     = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=metric&appid=#{api_key}".freeze
    # Call Open Weather API
    forecasts_serialized = open(url).read
    forecasts_hash       = JSON.parse(forecasts_serialized)
    # Call transform data
    transform forecasts_hash
  end

  private

  def transform forecasts_hash
    # Initialize forecasts data object
    forecasts = []

    # Append 48hr data to relevant weather arrays
    forecasts_hash["hourly"].each do |forecast|
      forecasts << {
        :dt => forecast["dt"],
        :temp => forecast["temp"],
        :feels_like => forecast["feels_like"],
        :wind_speed => forecast["wind_speed"],
        :rain => forecast["rain"].nil? ? 0 : forecast["rain"]["1h"],
        :long_description => forecast["weather"][0]["description"],
        :short_description => forecast["weather"][0]["main"], 
      }
    end

    forecasts
  end
end
