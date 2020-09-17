class WeatherApiJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "I'm starting the weather API job"
    # We need to update for all user # for each user
    user = User.last
    updated_weather = Weather.call(user.latitude, user.longitude)
    puts updated_weather
    puts "Weather has been refreshed"
  end
end
