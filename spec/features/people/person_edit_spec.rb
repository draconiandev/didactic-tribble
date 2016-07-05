include Warden::Test::Helpers
Warden.test_mode!

feature 'User edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'person changes email address' do
    person = create(:person)
    signin(person.email, person.password)
    visit edit_person_registration_path(person)
    fill_in 'person_email', with: 'newemail@example.com'
    fill_in 'person_current_password', with: person.password
    click_button 'Update'
    txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  scenario "person cannot cannot edit another person's profile", :me do
    me = create(:person)
    other = create(:person, email: 'other@example.com')
    signin(me.email, me.password)
    visit edit_person_registration_path(other)
    expect(page).to have_content 'Edit Your Account'
    expect(page).to have_field('Email', with: me.email)
  end
end
