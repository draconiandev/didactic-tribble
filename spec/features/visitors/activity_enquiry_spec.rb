feature 'A visitor' do
  scenario 'can enquire about an activity successfully with valid attributes', js: true do
    activity = create(:activity)
    visit activities_path
    click_link activity.title
    click_button 'Enquire'
    fill_in 'Name', with: 'Ashok Kumar'
    fill_in 'Email', with: 'ashok@kumar.com'
    fill_in 'Phone', with: '+919611201234'
    fill_in 'Message', with: 'Some requirements'
    click_button 'Submit'

    expect(page).to have_content('Thank you for your enquiry. We will get back soon to help you in your plans!')
  end

  scenario 'cannot enquire about an activity with invalid attributes', js: true do
    activity = create(:activity)
    visit activities_path
    click_link activity.title
    click_button 'Enquire'
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'ashok@kumar.com'
    fill_in 'Phone', with: '+919611201234'
    fill_in 'Message', with: 'Some requirements'
    click_button 'Submit'

    expect(page).to have_content('Sorry! We could not deliver the message. Please try again')
  end
end
