class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :role, :phone, :description,
                                                       :avatar_file_name, :birthdate, :gender, :email])
  end

end
