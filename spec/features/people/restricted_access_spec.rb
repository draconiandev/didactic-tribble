feature 'Registered user' do
  
  before do
    login_as(create(:person, :user))
  end

  scenario 'cannot enter policy restricted areas', js: true do
    visit new_activity_path
    expect(page.current_path).to eq root_path
  end
end
