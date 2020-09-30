require 'weather_service'
require 'pry-byebug'
require 'location'
require 'forecast'

class Notification

  START_TIME = 8
  END_TIME = 17
  IDEAL_TEMP = 23
  # currently 1601474400, check tomorrow
  
  
  def get
    tomorrow_start_of_day = (DateTime.now.at_midnight + 2.day).to_time.to_i
    # TODO currently returning 96 entries not 48
    @forecasts = Forecast.where('dt < ?', tomorrow_start_of_day)
    binding.pry
    # Filter by freetime
    @freetime_filtered_forecasts = @forecasts.select do |forecast|
      # TODO: Add in for array
      Time.at(forecast.dt).hour >= START_TIME && Time.at(forecast.dt).hour < END_TIME
    end

    # Filter by rain
    @rain_filtered_forecasts = @freetime_filtered_forecasts.select { |forecast| forecast[:rain] < 0.1 }

    if @rain_filtered_forecasts.empty?
      # TODO fix this logic
      @rain_filtered_forecasts = Forecast.all
      # @freetime_filtered_forecasts.min_by { |forecast| forecast[:rain].min }
    end

    # Find most ideal temperature
    @ideal_forecast = @rain_filtered_forecasts.sort_by do |forecast|
      (forecast.temp - IDEAL_TEMP).abs
    end
    # TODO: Catch if there is no non-raining period
    @ideal_forecast.first

  end

end

# User should have one location

# User needs a specific time offset

# filter list => which does processing




# # Calculating offset
# @forecast = Weather::WeatherClient.new
# @hourly_data_hash = @forecast.get(46.47, 18.83)


# # Initialize availability arrays
# available_data_hash         = {}
# available_temp_array        = []
# available_feels_like_array  = []
# available_dt_array          = []
# available_wind_speed_array  = []
# available_rain_array        = []
# available_description_array = []
# available_main_array        = []

# # Pull out each forecast array
# timezone_offset   = @hourly_data_hash[:timezone_offset]
# temp_array        = @hourly_data_hash[:temp]
# feels_like_array  = @hourly_data_hash[:feels_like]
# dt_array          = @hourly_data_hash[:dt]
# wind_speed_array  = @hourly_data_hash[:wind_speed]
# rain_array        = @hourly_data_hash[:rain]
# description_array = @hourly_data_hash[:description]
# main_array        = @hourly_data_hash[:main]

# # Filter data by freetimes
# freetimes_array.each do |freetime|
#   available_temp_array        << temp_array[freetime]
#   available_feels_like_array  << feels_like_array[freetime]
#   available_dt_array          << dt_array[freetime]
#   available_wind_speed_array  << wind_speed_array[freetime]
#   available_rain_array        << rain_array[freetime]
#   available_description_array << description_array[freetime]
#   available_main_array        << main_array[freetime]
# end

# # Build new forecast hash based on freetimes
# available_data_hash = {
#   temp:        available_temp_array,
#   feels_like:  feels_like_array,
#   dt:          available_dt_array,
#   wind_speed:  available_wind_speed_array,
#   rain:        available_rain_array,
#   description: available_description_array,
#   main:        available_main_array,
# }

# # Filter any hours with rain
# rain_array   = available_data_hash[:rain]
# p rain_index = rain_array.each_index.select { |index| rain_array[index] > 0 }

# # TODO filter each array in  hash index if rain, need to maintain index
# p available_data_hash[:temp]

# # 
# STANDARD_TEMP = 23   # Ideal temperature 
# temp_array    = available_data_hash[:temp]

# # Check each hour temp against ideal temp
# ideal_temp_array = temp_array.each do |temp|
#   (temp - STANDARD_TEMP).abs
# end

# # Sort temp values TODO probably pick higher temp values if available
# temp_array = []
# ideal_temp = ideal_temp_array.sort_by do |hourly, index|
#   temp_array << hourly
# end

# # Choose first of sorted array
# p ideal_temp.first

