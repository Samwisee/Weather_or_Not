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
    #  @user = User.find(id: 1)
    #   lat = @user.latitude
    #   lon = @user.longitude
    #   data = Weather.call(lat, lon)
    #   @forecast = Forecast.new(data)
    DateTime.current.new_offset(timezone).day + 1 ==  Time.at(@params['dt']).to_datetime.new_offset(timezone).day
    # TODO: Use timezone from forecast.rb
    # Time.current.day + 1 ==  ((DateTime.strptime(@params['dt'].to_s, '%s')) + @forecast.timezone.hour).day
  end
  
  def to_data
    [normalized_temperature, datetime, temperature]
  end
  
  private
  
  def normalized_temperature
    (temperature - STANDARD_TEMPERATURE).abs
  end

end
