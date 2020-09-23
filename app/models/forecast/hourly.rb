require_relative '../forecast.rb'
class Forecast::Hourly
  STANDARD_TEMPERATURE = 25

  def initialize(params = {})
    @params = params
    
  end
  
  
  def datetime
    Time.at(@params["dt"]).to_datetime.new_offset(timezone)
  end

  def temperature
    @params["temp"]
  end

  def feels_like_temperature
    @params["feels_like"]
  end

  def timezone
    @params[:timezone]
  end

  def tomorrow?
    DateTime.current.new_offset(timezone).day + 1 ==  Time.at(@params['dt']).to_datetime.new_offset(timezone).day
  end
  
  def to_data
    [normalized_temperature, datetime, temperature]
  end
  
  private
  
  def normalized_temperature
    (temperature - STANDARD_TEMPERATURE).abs
  end

end
