# Refractor duplicate codes later
class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @person = Person.find_or_create_from_omniauth(auth_hash)
    if @person.persisted?
      sign_in_and_redirect @person, event: :authentication
      set_flash_message(:notice, :success,
                        kind: 'Facebook') if is_navigational_format?
    else
      redirect_to new_person_registration_url
    end
  end

  def google
    @person = Person.find_or_create_from_omniauth(auth_hash)
    if @person.persisted?
      sign_in_and_redirect @person, event: :authentication
      set_flash_message(:notice, :success,
                        kind: 'Google') if is_navigational_format?
    else
      redirect_to new_person_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
