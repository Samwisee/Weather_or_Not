class NotificationJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting the weather API job"
  
    ######## TODO: This job needed a  refresh, has been renamed from weather_api_job.rb

    users = User.all
    users.each do |user|
      # we need to pass weather information to the email via usermailer.forecast method
      UserMailer.with(user: user).forecast.deliver_now
    end
    puts "Weather has been refreshed"
  end

  def check_db_for_city
    locations = Location.all

  end
end
