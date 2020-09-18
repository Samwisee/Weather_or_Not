class WeatherApiJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "I'm starting the weather API job"
    # We need to update for all user # for each user
    # user = User.last
    # updated_weather = Weather.call(user.latitude, user.longitude)
    User.all.each do |user|
      Weather.call.update(user.latitude, user.longitude)
    end
    
    puts updated_weather
    puts "Weather has been refreshed"
  end
end
