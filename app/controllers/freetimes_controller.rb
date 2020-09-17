class FreetimesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @freetime = Freetime.new
  end
  
  def create
    user_mailer = UserMailer.with(user: User.last)
    user_mailer.welcome.deliver_now
    p "Email sent"
  end
#   def create
#     @freetime = Freetime.new(params)
#     if @freetime.save
#       redirect_to 
#     else
#       render 'new'
#     end
#   end

  private

  def human_params
    params.require(:freetimes).permit(:start_at, :end_at)
  end
end
