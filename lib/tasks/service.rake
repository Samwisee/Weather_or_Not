namespace :service do
  desc "Refresh OpenWeather API"
  task api_refresh: :environment do
    puts "refreshing api"
    WeatherApiJob.perform_later
    puts "completed API call"
  end
end
