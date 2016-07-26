feature 'Admin' do

  let(:admin) { create(:person, :admin) }

  before do
    vendor = create(:vendor)
    login_as(admin)
    visit vendors_path
    click_link vendor.name
    click_link 'Edit Vendor'
  end

  scenario 'can update vendors with valid attributes' do    
    fill_in 'Name', with: 'Trekking Company'
    click_button 'Submit'

    expect(page).to have_content 'Vendor has been updated'
    expect(page).to have_content 'Trekking Company'
  end

  scenario 'cannot update vendors with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Submit'

    expect(page).to have_content 'Vendor could not be updated'
  end
  
end