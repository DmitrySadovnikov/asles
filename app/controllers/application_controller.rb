class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   admin_path
  # end
  #
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end

  # def authorize_admin
  #   redirect_to :back, :status => 401 unless current_user.admin
  #   #redirects to previous page
  # end

end
