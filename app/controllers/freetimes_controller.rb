class FreetimesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @freetime = Freetime.new
  end
  
  def create
    @freetime = Freetime.find_by(user: current_user, period: "morning")
    if @freetime
      @freetime.update(freetime_params)
    else
      @freetime = Freetime.new(freetime_params)
      @freetime.user = current_user
      if @freetime.save
      else
        render 'new'
      end
    end
  end
  
  def send_mail_and_redirect
    redirect_to root_path
    UserMailer.welcome(current_user).deliver_now
  end

  private

  def freetime_params
    params.require(:freetime).permit(:start_at, :end_at, :active, :period)
  end
end
