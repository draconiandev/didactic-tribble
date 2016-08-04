# Feature: Sign in
feature 'A visitor', :omniauth do
  before(:each) do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  scenario 'can sign in with facebook account successfully with valid credentials' do
    fb_signin
    expect(page).to have_content('Log Out')
    expect(current_path).to eq(root_path)
  end

  scenario 'cannot sign in with facebook account with invalid credentials' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit new_person_registration_path
    expect(page).to have_content('Sign Up')
    visit '/people/auth/facebook'
    expect(current_path).to eq(root_path)
    expect(page).not_to have_content('Log Out')
  end
end
