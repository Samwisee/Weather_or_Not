class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    super
  end

  def create
    location_raw = params[:user][:location_attributes]
    location = Location.find_or_create_by name: location_raw[:name], lat: location_raw[:lat], lon: location_raw[:lon]
    
    # add a location id to the params to create with the user
    params.merge!(locations_id: location.id, location: location)
    super
    
  end

  private

  def resource_params
    params.require(:user).permit(:name, :email, :password, location_attributes: [:name, :lat, :lon])
  end

  def after_sign_up_path_for(resource)
    "/freetimes/new"
  end

  def after_inactive_sign_up_path_for(resource)
    "/freetimes/new"
  end

end
