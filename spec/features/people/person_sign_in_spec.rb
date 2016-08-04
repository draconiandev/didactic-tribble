# Add invalid tests later
feature 'Person' do
  scenario 'cannot sign in if not registered' do
    signin('test@example.com', 'please1231@#')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database',
                                        authentication_keys: 'Email'
  end

  scenario 'can sign in with valid credentials' do
    person = FactoryGirl.create(:person)
    signin(person.email, person.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'cannot sign in with wrong email' do
    person = FactoryGirl.create(:person)
    signin('invalid@email.com', person.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database',
                                        authentication_keys: 'Email'
  end

  scenario 'cannot sign in with wrong password' do
    person = FactoryGirl.create(:person)
    signin(person.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid',
                                        authentication_keys: 'Email'
  end
end
