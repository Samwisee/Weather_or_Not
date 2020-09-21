class WeatherApiJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "I'm starting the weather API job"
    # We need to update for all user # for each user
    # user = User.last
    # updated_weather = Weather.call(user.latitude, user.longitude)
    #TODO: to change the logic to check the API table first before calling the API
    users = User.all
    users.each do |user|
      data =  Weather.call(user.latitude, user.longitude)
      # we need to pass weather information to the email via usermailer.forecast method
    
      @forecast = Forecast.new(data)
      UserMailer.with(forecast: @forecast, user: user).forecast.deliver_now
    end

    # user_available_hours = User.find(25).available_hours
    # # refactor this to include in forecast to filter with availability
    # user_available_hours.each do |free_time|
    #   available_data << tomorrow_hourlies_for[free_time]
    # end
    
    puts "Weather has been refreshed"
  end
end
