#
include Warden::Test::Helpers
Warden.test_mode!

feature 'Person profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'Person sees own profile' do
    person = create(:person)
    signin(person.email, person.password)
    visit person_path(person)
    expect(page).to have_content 'Person'
    expect(page).to have_content person.name
    expect(page).to have_content person.email
  end

  # scenario "Person cannot see another person's profile" do
  #   me = create(:person)
  #   other = create(:person, email: 'other@example.com')
  #   signin(me.email, me.password)
  #   Capybara.current_session.driver.header 'Referer', root_path
  #   visit person_path(other)
  #   expect(page).to have_content 'You are not authorized to perform this action.'
  # end
end
