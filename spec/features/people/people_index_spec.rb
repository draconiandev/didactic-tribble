include Warden::Test::Helpers
Warden.test_mode!

feature 'User index', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'admin can see all accounts' do
    admin = create(:person, :admin)
    person = create(:person, email: 'other@example.com')
    signin(admin.email, admin.password)
    visit people_path
    expect(page).to have_content person.name
    expect(page).to have_content person.email
  end
  
  scenario 'editor can see all accounts' do
    admin = create(:person, :editor)
    person = create(:person, email: 'other@example.com')
    signin(admin.email, admin.password)
    visit people_path
    expect(page).to have_content person.name
    expect(page).to have_content person.email
  end

  scenario 'user cannot all accounts', :me do
    me = create(:person)
    other = create(:person, email: 'other@example.com')
    signin(me.email, me.password)
    visit people_path
    expect(page).to have_content 'You are already signed in'
  end
end
