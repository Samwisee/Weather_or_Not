class FreetimesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @freetime = Freetime.new
  end
  
  def create
    @user = current_user
    UserMailer.welcome(@user).deliver
    redirect_to root_path
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
