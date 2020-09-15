class FreetimesController < ApplicationController
  def new
    @freetime = Freetime.new
  end

  def create
    @freetime = Freetime.new(freetime_params)
    @freetime.user = current_user
    raise
    if @freetime.save
      redirect_to 
    else
      render 'new'
    end
  end

  private

  def human_params
    params.require(:freetime).permit(:start_at, :end_at)
  end
 
end
