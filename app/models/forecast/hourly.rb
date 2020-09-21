require_relative '../forecast.rb'
class Forecast::Hourly
  STANDARD_TEMPERATURE = 25

  def initialize(params = {})
    @params = params
    
  end
  
  
  def datetime
    Time.at(@params["dt"]).to_datetime
  end

  def temperature
    @params["temp"]
  end

  def feels_like_temperature
    @params["feels_like"]
  end

  def tomorrow?
    # DateTime.now.day + 1 ==  (DateTime.strptime(@params['dt'].to_s, '%s')).day
    # TODO: Use timezone from forecast.rb
    DateTime.now.day + 1 ==  ((DateTime.strptime(@params['dt'].to_s, '%s')) + 8.hour).day
  end
  
  def to_data
    [normalized_temperature, datetime, temperature]
  end
  
  private
  
  def normalized_temperature
    (temperature - STANDARD_TEMPERATURE).abs
  end

end
