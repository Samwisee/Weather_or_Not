require 'weather_service'
require 'pry-byebug'

class Notification

  FREETIMES_ARRAY = (8...17).to_a
  STANDARD_TEMP = 25

  def get
    now = Time.now
    @forecast = Forecast.all
    @forecast = @forecast.as_json
  end

  def transform_time

    Time.at(seconds_since_epoch_integer).to_datetime
  end

  def ideal_temp
    get
    temp = []
    @forecast.each do |forecast|
      temp << forecast[:temp]
    end
    p temp.count # TODO: Outputs 96 hours of data not 
    
  end

end


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

