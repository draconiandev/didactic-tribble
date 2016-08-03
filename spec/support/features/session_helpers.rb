#
module Features
  def sign_up(name, email, password)
    visit new_person_registration_path
    fill_in 'person[name]', with: name
    fill_in 'person[email]', with: email
    fill_in 'person[password]', with: password, match: :prefer_exact
    # click_button 'Sign up'
    find(:xpath, "//input[contains(@name, 'commit')]").click
  end

  def signin(email, password)
    visit new_person_session_path
    fill_in 'person[email]', with: email
    fill_in 'person[password]', with: password
    # click_button 'Sign in'
    find(:xpath, "//input[contains(@name, 'commit')]").click
  end
end
