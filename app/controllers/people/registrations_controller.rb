# If you have extra params to permit, append them to the sanitizer.
class People::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:name, :email, :password,
                                             :current_password])
  end
end
