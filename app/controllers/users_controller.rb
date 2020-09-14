class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
        render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :city_name, :latitude, :longtitude, :email)
  end

end
