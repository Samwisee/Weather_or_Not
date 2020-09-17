class Forecast
  def initialize(params = {})
    @params = params
  end

  def hourlies
    @params["hourly"].map { |hourdata| Forecast::Hourly.new(hourdata) }
  end
end