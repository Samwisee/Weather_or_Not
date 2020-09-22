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
      user_available_hours = user.available_hours
      filter_user_available_hours = user_available_hours.collect do |free_hour|
        @forecast.tomorrow_hourlies_for[free_hour - 1]
      end
      binding.pry
      UserMailer.with(forecast: @forecast, user: user).forecast.deliver_now
    end

    
    puts "Weather has been refreshed"
  end
end
