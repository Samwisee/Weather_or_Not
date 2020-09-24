class Forecast

  def initialize(params = {})
    @params = params
  end

  def timezone
    @params = JSON.parse(@params) if (@params.is_a? String) 
    offset = (@params['timezone_offset'] / 3600)
    offset.positive? ? "+#{offset}" : offset.to_s
  end

  def hourlies
    @params = JSON.parse(@params) if (@params.is_a? String) 
    @params["hourly"].map { |hourdata| Forecast::Hourly.new(hourdata.merge(timezone: timezone)) }
  end

  def dailies
    @params = JSON.parse(@params) if (@params.is_a? String) 
    @params["daily"].map { |daydata| Forecast::Daily.new(daydata) }

  end

  def tomorrow_weather
    dailies.first.weather
    
  end

  def tomorrow_weather_description
   dailies.first.weather_description
  end

  def tomorrow_weather_icon
    dailies.first.weather_icon
  end
 
  def tomorrow_24hourly_data
    hourlies.select(&:tomorrow?)
  end

  def best_tomorrow_hourly(user)
    tomorrow_24hourly_filter_data(user).sort_by do |hourly|
      hourly.to_data[0]
    end.first
  end

  def tomorrow_24hourly_filter_data(user)
    user_available_hours = user.available_hours
    filter_user_available_hours = user_available_hours.collect do |free_hour|
      tomorrow_24hourly_data[free_hour]
    end
    filter_user_available_hours
  end

end

