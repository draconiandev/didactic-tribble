include Warden::Test::Helpers
Warden.test_mode!

feature 'person delete', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'Person can delete own account' do
    person = create(:person)
    signin(person.email, person.password)
    visit edit_person_registration_path(person)
    save_and_open_page
    click_link 'Delete my account'
    # page.driver.browser.switch_to.alert.accept
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end
end
