#TODO refactor 
class Forecast::Hourly
  STANDARD_TEMPERATURE = 25

  def initialize(params = {})
    @params = params
  end
  
  def time_of_hour
    Time.at(@params["dt"])
  end

  def temperature
    @params["temp"]
  end

  def warm?
    temperature > STANDARD_TEMPERATURE
  end

  def hour
    time_of_hour.hour
  end

end
