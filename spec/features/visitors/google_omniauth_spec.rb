# # Feature: Sign in
# feature 'Sign in with google account', :omniauth do
#   before(:each) do
#     OmniAuth.config.mock_auth[:google] = nil
#   end

#   scenario 'successfully with valid credentials' do
#     google_signin
#     expect(page).to have_content('Log Out')
#     expect(current_path).to eq(root_path)
#   end

#   scenario 'is not possible with invalid credentials' do
#     OmniAuth.config.mock_auth[:google] = :invalid_credentials
#     visit new_person_registration_path
#     expect(page).to have_content('Sign Up')
#     visit '/people/auth/google'
#     expect(page).not_to have_content('Log Out')
#   end
# end
