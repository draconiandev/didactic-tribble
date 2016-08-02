feature 'Managers' do
  before do
    login_as(create(:person, :admin))
    visit activities_path
    click_link 'New Activity'
  end

  scenario 'can create a new activity with valid attributes' do
    # # fill_in 'Title',                            with: 'Kunthi Betta'
    # # fill_in 'activity[overview]',               with: 'An awesome place'
    # # fill_in 'activity[itinerary]',              with: 'Day 1'
    # # fill_in 'Price',                            with: '1000'
    # # page.execute_script("$('#activity_start_date').val('21/12/2016')")
    # # page.execute_script("$('#activity_end_date').val('22/12/2016')")
    # # find('#activity_difficulty').find(:xpath, 'option[2]').select_option
    # # find("option[value='Easy']").click
    # # find('#activity_location_id > option:nth-child(1)').click
    # # select 'Easy',                              from: 'activity_difficulty'
    # # page.attach_file('activity_activity_cover', 'spec/fixtures/files/card.jpg')
    # attach_file 'activity[activity_cover]', File.join(Rails.root,'spec', 'fixtures', 'files', 'card.jpg')
    # fill_in 'Slug',                             with: 'Kunthi Betta'
    # fill_in 'Meta description',                 with: 'Kunthi Betta'
    # click_button 'Submit'

    # expect(page).to have_content 'Activity has been created'
    # activity = Activity.find_by(title: 'Kunthi Betta')
    # expect(page.current_url).to eq activity_url(activity)
    # #title = 'Kunthi Betta | Trekhub'
    # #expect(page).to have_title title
  end

  scenario 'cannot create a new activity without valid attributes' do
    click_button 'Update'
    expect(page).to have_content "can't be blank"
  end
end
