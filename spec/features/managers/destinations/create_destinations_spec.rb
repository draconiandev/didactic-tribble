#
feature 'Managers' do
  before do
    login_as(create(:person, :admin))
    visit destinations_path
    click_link 'New Destination'
  end

  scenario 'can create new destinations with valid attributes' do

    fill_in             'Name', with: 'Ramanagara'
    fill_in             'destination[description]', with: 'An awesome place'
    fill_in             'destination[brief]', with: 'An awesome description'
    page.attach_file('destination_cover', 'spec/fixtures/files/card.jpg')
    click_button        'Submit'

    expect(page).to have_content 'Destination has been created'

    destination = Destination.find_by(name: 'Ramanagara')
    expect(page.current_url).to eq destination_url(destination)
  end

  scenario 'cannot create new destinations without valid attributes', js: true do
    click_button 'Submit'
    expect(page).to have_content "Name can't be blank"
  end
end
