# Run some invalid signup tests later
feature 'Visitor' do
  scenario 'signs up successfully with valid email and password' do
    visit new_person_session_path
    click_on 'Sign up'
    fill_in 'person[name]', with: 'example user'
    fill_in 'person[email]', with: 'example@user.com'
    fill_in 'person[password]', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Sign up'
  end

  scenario 'cannot sign up with invalid email address' do
    sign_up('awesome user', 'bogus', 'please123')
    expect(page).to have_content 'is invalid'
  end

  scenario 'cannot sign up without password' do
    sign_up('awesome user', 'test@example.com', '')
    expect(page).to have_content "can't be blank"
  end

  scenario 'cannot sign up without name' do
    sign_up('', 'test@example.com', 'pleas')
    expect(page).to have_content "can't be blank"
  end

  scenario 'cannot sign up with a short password' do
    sign_up('awesome user', 'test@example.com', 'pleas')
    expect(page).to have_content 'is too short'
  end
end
