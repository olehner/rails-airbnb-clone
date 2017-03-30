class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?
  after_filter :store_location



  attr_reader :current_user
  helper_method :current_user

  def current_user
    @current_user ||= current_account.try(:user)
  end


  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/accounts/sign_in" &&
    request.path != "/accounts/sign_up" &&
    request.path != "/accounts/password/new" &&
    request.path != "/accounts/password/edit" &&
    request.path != "/accounts/confirmation" &&
    request.path != "/accounts/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
  end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end
private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:account, request.url)
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end

end
