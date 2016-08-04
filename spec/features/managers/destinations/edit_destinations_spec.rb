feature 'Manager' do

  let(:admin) { create(:person, :admin) }

  before do
    destination = create(:destination)
    login_as(admin)
    visit destinations_path
    click_link destination.name
    click_link 'Edit Destination'
  end

  scenario 'can update destinations with valid attributes' do    
    fill_in 'Name', with: 'Mysuru'
    click_button 'Submit'

    expect(page).to have_content 'Destination has been updated'
    expect(page).to have_content 'Mysuru'
  end

  scenario 'cannot update destinations with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Submit'

    expect(page).to have_content 'Destination has not been updated'
  end
  
end