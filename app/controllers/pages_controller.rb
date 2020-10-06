
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  
  def home
    # if current_user # TODO this is breaking sign out 
    #   lat = current_user.latitude
    #   lon = current_user.longitude
    #   data = Weather.call(lat, lon)
    #   @forecast = Forecast.new(data)
    # end
  end
  
end
