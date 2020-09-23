class WeatherApiJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "I'm starting the weather API job"
    # We need to update for all user # for each user
    #TODO: to change the logic to check the API table first before calling the API
    users = User.all
    users.each do |user|
      # we need to pass weather information to the email via usermailer.forecast method
      UserMailer.with(user: user).forecast.deliver_now
    end
    puts "Weather has been refreshed"
  end
end
