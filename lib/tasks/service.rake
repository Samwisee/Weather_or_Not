namespace :service do
  desc "Refresh OpenWeather API"
  task api_refresh: :environment do
    puts "refreshing api"
    WeatherService.update_forecasts
    NotificationJob.perform_now
    puts "completed API call"
  end
end
