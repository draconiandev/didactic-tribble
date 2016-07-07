feature 'Admins can view all states' do
  let(:admin) { create(:person, :admin) }

  before do
    login_as(admin)
  end

  scenario 'with the activity description' do
    activity = create(:activity)
    visit activities_path
    click_link activity.title
    expect(page.current_url).to eq activity_url(activity)
  end
end
