# CR use factoryGirl

feature "Admin visits dashboard" do

  scenario 'an admin visits admin page' do
    visit "admins/dashboard"
    expect(page).to have_content('Report Detail')
    expect(page).to have_content("Recent Reports")
  end
end

feature "Admin searches for an incident " do

  scenario 'an admin searches incidents by content of event' do
    Event.create(submitter: "Jimmy", details: "She said I'm fat.", date: "2011-12-09")

    visit "admins/dashboard"
    fill_in "search", :with => "fat"
    click_button("search")

    expect(page).to have_content("2011-12-09")
  end

  # scenario 'an admin searches for events with submitter option in search field' do
  #   Event.create(submitter: "Ellen", details: "He barfed on me.", date: "2014-07-19", location: "stairwell", offender: "do-do-bird")
  #   visit "admins/dashboard"
  #   expect(response).to eq(200)

  #   fill_in "Search", :with => "Ellen"
  #   click_button "Search Reports"
  #   expect(page).to have_content("He barfed")

  # end
end

