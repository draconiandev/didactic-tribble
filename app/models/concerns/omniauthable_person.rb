#
module OmniauthablePerson
  extend ActiveSupport::Concern
  included do
    def self.find_or_create_from_omniauth(auth)
      person = where(provider: auth.provider, uid: auth.uid).first_or_create
      person.skip_confirmation!
      person.update(name:     auth.info.name,
                    email:    auth.info.email,
                    password: Devise.friendly_token[0, 20])
      person
    end
  end

  def first_name
    name.blank? ? '' : name.split(' ')[0].titleize
  end
end
