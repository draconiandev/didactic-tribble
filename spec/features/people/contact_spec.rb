feature 'A visitor' do

  before do
    login_as(create(:person, :user))
  end

  scenario 'can contact the company successfully with valid attributes' do
    visit '/contact'
    fill_in 'Phone', with: '+919611201234'
    fill_in 'Message', with: 'Some requirements'
    click_button 'Submit'

    expect(page).to have_content('Thank you for your message. We will contact you soon!')
  end

  scenario 'cannot contact the company successfully with invalid attributes' do
    visit '/contact'
    fill_in 'Phone', with: ''
    fill_in 'Message', with: 'Some requirements'
    click_button 'Submit'

    expect(page).to have_content('Sorry! We could not deliver the message. Please try again')
  end
end
