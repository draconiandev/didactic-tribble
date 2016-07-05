RSpec.feature 'Admin can update a destinations' do

  let(:admin) { create(:person, :admin) }

  before do
    destination = create(:destination)
    login_as(admin)
    visit destinations_path
    click_link destination.name
    click_link 'Edit Destination'
  end

  scenario 'with valid attributes' do    
    fill_in 'Name', with: 'Mysuru'
    click_button 'Submit'

    expect(page).to have_content 'Destination has been updated'
    expect(page).to have_content 'Mysuru'
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Submit'

    expect(page).to have_content 'Destination has not been updated'
  end
  
end