feature 'Managers can edit activities' do
  let(:admin) { create(:person, :admin) }

  before do
    activity = create(:activity)
    login_as(admin)
    visit activities_path
    click_link activity.title
    click_link 'Edit Activity'
  end

  scenario 'can update an activity with valid attributes' do    
    fill_in 'Title', with: 'Kunthi Hills'
    click_button 'Update'

    expect(page).to have_content 'Activity has been updated'
    expect(page).to have_content 'Kunthi Hills'
  end

  scenario 'cannot update an activity with invalid attributes' do
    fill_in 'Title', with: ''
    click_button 'Update'

    expect(page).to have_content "Title can't be blank"
  end  
end
