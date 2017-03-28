class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #als niet wel log-in maar geen User --> User.new
end
