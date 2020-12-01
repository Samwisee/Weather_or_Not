class RegistrationsController < Devise::RegistrationsController

  private

  # build_resource is a hook in Devise called just before the resource is saved
  # this allows us to mutate some attributes of the resource (i.e. the User) just before it's written to the DB
  def build_resource params=nil
    # TODO: proper error handling on Location find or create

    if params == nil
      super params
    end

    location_attrs = params.delete(:location_attributes)
    location = Location.find_or_create_by name: location_attrs[:name], lat: location_attrs[:lat], lon: location_attrs[:lon]

    super 
    # call the usual Devise resource build (i.e. basically User.new params)
    # but now params won't have the location_attributes on them, this is only something we need temporarily to
    # drive the find_or_create_by location

    # set the location_id foreign on the resource (i.e. the User) explicitly before the "save" operation takes place
    resource.locations_id = location.id
  end

  def after_sign_up_path_for(resource)
    "/freetimes/new"
  end

  def after_inactive_sign_up_path_for(resource)
    "/freetimes/new"
  end

end
