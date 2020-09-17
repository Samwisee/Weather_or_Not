class RegistrationsController < Devise::RegistrationsController

  private

  def after_sign_up_path_for(resource)
    "/users/#{:user_id}/freetimes/new"
  end

  def after_inactive_sign_up_path_for(resource)
    "/users/#{:user_id}/freetimes/new"
  end
end
