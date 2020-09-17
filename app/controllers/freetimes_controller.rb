class FreetimesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @freetime = Freetime.new
  end

  def create
    @freetime = Freetime.new(params)
    raise
    if @freetime.save
      # redirect_to 
    end
  end

  private

  def human_params
    params.require(:freetimes).permit(:start_at, :end_at)
  end

  
 
end
