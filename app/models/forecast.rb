class Forecast < ApplicationRecord
  belongs_to :location

  def initialize(params = {})
    @start_time = 8 # params.fetch(:start_time, 8)
    @end_time = 17 # params.fetch(:end_time, 17)
  end

  def filter_forecasts
    # Run filters for hourly weather data
    forecast_by_freetime = filter_by_freetimes(@start_time, @end_time)
    forecast_by_rain = filter_by_rain(forecast_by_freetime)
    forecast_by_ideal_temp = filter_by_ideal_temp(forecast_by_rain)
  end
  
  private

  def filter_by_freetimes(start_time, end_time)
    # Set up time period between today's midnight and tomorrow's midnight
    midnight_tomorrow = (DateTime.now.at_midnight + 2.day).to_time.to_i
    midnight_today = (DateTime.now.at_midnight + 1.day).to_time.to_i
    forecasts_all = Forecast.where('dt <= ? AND dt > ?', midnight_tomorrow, midnight_today)
    @forecasts = forecasts_all.sort_by { |k| :created_at}
    binding.pry

    # Filter by freetime
    @forecasts.select do |forecast|
      # TODO: Add in for array
      Time.at(forecast.dt).hour >= start_time && Time.at(forecast.dt).hour < end_time
    end

  end

  def filter_by_rain forecasts_by_freetimes
    # Filter by rain for no rain
    rain_filtered_forecasts = forecasts_by_freetimes.select { |forecast| forecast[:rain] = 0.0 }

    # If no periods without rain, use a little rain
    if rain_filtered_forecasts.empty?
      rain_filtered_forecasts = forecasts_by_freetimes.select { |forecast| forecast[:rain] < 0.5 }
    end

    # If array is still empty return
    if rain_filtered_forecasts.empty?
      "Probably not the best day to go out"
    end

    rain_filtered_forecasts
  end

  def filter_by_ideal_temp forecasts_by_rain, ideal_temp=23
    # Sort by temperature closest to ideal temp
    @ideal_forecasts = forecasts_by_rain.sort_by do |forecast|
      (forecast.temp - ideal_temp).abs
    end
    # Pick top forecast object
    @ideal_forecasts.first
  end

end
