#
module Omniauth
  module Mock
    def fb_auth_mock
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '1234567',
        info: {
          email: 'fbmock@user.com',
          name: 'Mock User'
        },
        credentials: {
          token: 'ABCDEF...',
          expires_at: 132_174_720,
          expires: true })
    end

    def google_auth_mock
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
        provider: 'google',
        uid: '12345678',
        info: {
          email: 'googlemock@user.com',
          name: 'Mock User'
        },
        credentials: {
          token: 'ABCDEF...',
          expires_at: 132_174_720,
          expires: true })
    end
  end

  module SessionHelpers
    def fb_signin
      visit new_person_registration_path
      fb_auth_mock
      visit '/people/auth/facebook'
    end

    def google_signin
      visit new_person_registration_path
      google_auth_mock
      visit '/people/auth/google'
    end
  end
end
