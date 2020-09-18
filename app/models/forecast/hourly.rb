#TODO refactor 
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

  def warm?
    temperature > STANDARD_TEMPERATURE
  end

  def tomorrow?
    Time.now().day + 1 ==  DateTime.strptime(@params['dt'].to_s, '%s').day
  end
  
  def to_data
    [normalized_temperature, datetime, temperature]
  end
  
  private
  
  def normalized_temperature
    (temperature - STANDARD_TEMPERATURE).abs
  end

end
