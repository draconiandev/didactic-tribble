RSpec.feature 'Admins can delete an activity' do  
  before do
    login_as(create(:person, :admin))
  end

scenario 'successfully' do
    activity = create(:activity)
    visit activities_path
    click_link activity.title
    click_link 'Delete Activity'
    
    expect(page).to have_content 'Activity has been deleted'
    expect(page.current_url).to eq activities_url
    expect(page).to have_no_content 'MyString'
  end
end
