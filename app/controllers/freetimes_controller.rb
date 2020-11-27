class FreetimesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @freetime = Freetime.new
  end

  def create
    @freetime = Freetime.find_or_initialize_by(user: current_user, period: params.dig(:freetime, :period))
    @freetime.update!(freetime_params)
  end
  
  def send_mail_and_redirect
    redirect_to root_path
    # UserMailer.welcome.deliver_now
  end

  private

  def freetime_params
    params.require(:freetime).permit(:start_time, :end_time, :active, :period)
  end
end
