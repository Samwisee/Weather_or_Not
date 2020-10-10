namespace :service do
  desc "Refresh OpenWeather API"
  task api_refresh: :environment do
    puts "Starting Weather API refresh"
    WeatherApiJob.perform_now
    puts "Completed Weather API job"
  end

  task notification: :environment do
    puts "Starting notification job"
    NotificationJob.perform_now
    puts "Notification job completed"
  end
end
