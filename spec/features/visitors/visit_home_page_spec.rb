feature 'User visits homepage' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content 'Sign Up'
  end
end
