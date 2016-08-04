feature 'Managers can view all enquiries associated with an activity' do
  let(:admin) { create(:person, :admin) }

  before do
    login_as(admin)
  end

  scenario 'along with the activity description' do
    # activity = create(:activity)
    enquiry = create(:enquiry)
    visit activities_path
    click_link enquiry.activity.title

    expect(page.current_url).to eq activity_url(enquiry.activity)

    click_link 'Enquiries'
    expect(page).to have_content enquiry.name
  end
end
