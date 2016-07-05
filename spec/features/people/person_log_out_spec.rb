# Add invalid tests later
feature 'Person logs out' do
  scenario 'successfully' do
    person = create(:person)
    signin(person.email, person.password)
    expect(page).to have_content 'Log Out'
    click_on 'Log Out', match: :first
    expect(current_path).to eq(root_path)
    expect(page).to have_content 'Sign In'
  end
end
