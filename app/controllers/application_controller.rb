class ApplicationController < ActionController::Base
     include ApplicationHelper
     include LikesHelper
     include CommentsHelper

     before_action :configure_permitted_parameters, if: :devise_controller?

     helper_method :truncate_name_if_too_long, :shorten_time_format, :make_large_number_readable

     protected

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :profile_image])
     end

     
end
