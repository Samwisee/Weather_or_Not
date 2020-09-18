class Forecast::Daily

  def initialize(params = {})
    @params = params
  end

  def weather
    @params['weather'][0]['main']
  end

end