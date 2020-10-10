class WeatherApiJob < ApplicationJob
  queue_as :default  
  
  def perform
    service = WeatherService.new

    # write 48 hours of forecasts to the DB    
    locations = Location.all
    locations.each do |location|
      forecasts = service.forecasts location
      Forecast.insert_all(forecasts)
    end
  end
end
