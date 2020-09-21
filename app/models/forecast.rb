class Forecast
  attr_reader :timezone
  def initialize(params = {})
    @params = params
  end

  # Use this method in hourly.rb
  def timezone
    @params = JSON.parse(@params) if (@params.is_a? String) 
    @params['timezone_offset'] / 3600
  end

  def hourlies
    @params = JSON.parse(@params) if (@params.is_a? String) 
    @params["hourly"].map { |hourdata| Forecast::Hourly.new(hourdata) }
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


  def tomorrow_hourlies
    hourlies.select(&:tomorrow?)
    potato

  end

  def best_tomorrow_hourly
    tomorrow_hourlies.sort_by do |hourly|
      hourly.to_data[0]
    end.first
  end

end

