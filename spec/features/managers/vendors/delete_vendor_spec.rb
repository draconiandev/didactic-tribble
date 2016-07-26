feature 'Admins can delete a vendor' do
  before do
    login_as(create(:person, :admin))
    create(:vendor, name: 'TrekkingCompany')
  end

  scenario do
    visit vendors_path
    click_link 'TrekkingCompany'
    click_link 'Delete Vendor'

    expect(page).to have_content 'Vendor has been deleted'
    expect(page.current_url).to eq vendors_url
    expect(page).to have_no_content 'TrekkingCompany'
  end
end
