feature 'Only managers can view vendors' do

  let(:admin) { create(:person, :admin) }

  before do
    login_as(admin)
  end

  scenario 'with the vendor description' do
    vendor = create(:vendor)
    visit vendors_path
    click_link vendor.name
    expect(page.current_url).to eq vendor_url(vendor)
  end

end