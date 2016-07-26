#
feature 'Managers' do
  before do
    login_as(create(:person, :admin))
    visit vendors_path
    click_link 'New Vendor'
  end

  scenario 'can create new vendors with valid attributes' do

    fill_in             'Name', with: 'An awesome vendor'
    fill_in             'vendor[contact_person]', with: 'A nice name'
    fill_in             'vendor[address]', with: 'A long address'
    fill_in             'vendor[city]', with: 'Some city'
    fill_in             'vendor[pincode]', with: 'Some city'
    fill_in             'vendor[phone]', with: '1234567890'
    fill_in             'vendor[email]', with: 'abc@abc.com'
    # page.attach_file('destination_cover', 'spec/fixtures/files/card.jpg')
    click_button        'Submit'

    expect(page).to have_content 'Vendor has been created'

    vendor = Vendor.find_by(name: 'An awesome vendor')
    expect(page.current_url).to eq vendor_url(vendor)
  end

  scenario 'cannot create new vendors without valid attributes' do
    click_button 'Submit'
    expect(page).to have_content 'Sorry! Vendor could not be created.'
    expect(page).to have_content "Name can't be blank"
  end
end
