class ApplicationController < ActionController::Base

# saves the location before loading each page so we can return to the
# right page. If we're on a devise page, we don't want to store that as the
# place to return to (for example, we don't want to return to the sign in page
# after signing in), which is what the :unless prevents
before_action :store_current_location, :unless => :devise_controller?
after_action  :store_location


private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
    request.path != "/users/sign_up" &&
    request.path != "/users/password/new" &&
    request.path != "/users/password/edit" &&
    request.path != "/users/confirmation" &&
    request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
  session[:previous_url] = request.fullpath 
end
end

def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
    request.path != "/users/sign_up" &&
    request.path != "/users/password/new" &&
    request.path != "/users/password/edit" &&
    request.path != "/users/confirmation" &&
    request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
  session[:previous_url] = request.fullpath 
end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

def after_sign_out_path_for(resource_or_scope)
  request.referrer
end

end
