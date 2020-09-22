class Forecast::Daily

  def initialize(params = {})
    @params = params
  end

  def weather
    @params['weather'][0]['main']
  end

  def weather_description
    @params['weather'][0]['description']
  end

  def weather_icon
    "http://openweathermap.org/img/wn/#{@params['weather'][0]['icon']}@2x.png"
  end
end