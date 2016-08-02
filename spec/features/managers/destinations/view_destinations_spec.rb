RSpec.feature 'Everyone can view all destinations' do

  scenario 'with the destination description' do
    destination = create(:destination)
    visit destinations_path
    click_link destination.name
    expect(page.current_url).to eq destination_url(destination)
  end

end