#
module Features
  def sign_up(name, email, password, confirmation)
    visit new_person_registration_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password, match: :prefer_exact
    fill_in 'Password confirmation', with: confirmation, match: :prefer_exact
    # click_button 'Sign up'
    find(:xpath, "//input[contains(@name, 'commit')]").click
  end

  def signin(email, password)
    visit new_person_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    # click_button 'Sign in'
    find(:xpath, "//input[contains(@name, 'commit')]").click
  end
end
