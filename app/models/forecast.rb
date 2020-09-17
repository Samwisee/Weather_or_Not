class Forecast
  def initialize(params = {})
    @params = params
  end

  def hourlies
    @params["hourly"].map { |hourdata| Forecast::Hourly.new(hourdata) }
  end

  def dailies
    @params["daily"].map { |daydata| Forecast::Daily.new(daydata) }
  end

  def tomorrow
    dailies.first
  end

  def tomorrow_hourlies
    hourlies.select(&:tomorrow?)
  end

  def best_tomorrow_hourly
    tomorrow_hourlies.sort_by do |hourly|
      hourly.to_data[2]
    end.first
  end

end

