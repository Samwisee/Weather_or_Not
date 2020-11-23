class RegistrationsController < Devise::RegistrationsController

  def create
    location_raw = params[:user][:location]
    location = Location.find_or_create_by name: location_raw[:name], lat: location_raw[:lat], lon: location_raw[:lon]

    # add a location id to the params to create with the user
    params[:user].merge!(:locations_id => location.id)
    super
  end

  def build_resource
    resource_params
  end

  private

  def resource_params
    params.require(:user).permit(:name, :email, :password, :location, :locations_id)
  end

  def after_sign_up_path_for(resource)
    "/freetimes/new"
  end

  def after_inactive_sign_up_path_for(resource)
    "/freetimes/new"
  end
end
