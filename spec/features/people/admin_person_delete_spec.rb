RSpec.feature 'Admins can delete a person' do  
  before do
    person = create(:person, :admin)
    random = create(:person, email: 'random@example.com')
    signin(person.email, person.password)
  end

scenario 'successfully' do
    visit people_path
    click_link 'Delete person'
    
    expect(page).to have_content 'The account was successfully deleted'
    expect(page.current_url).to eq people_url
    expect(page).to have_no_content 'random.name'
  end
end
