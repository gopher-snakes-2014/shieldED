feature "Admin visits dashboard" do

  scenario 'an admin visits admin page' do
    visit "admins/dashboard"
    expect(page).to have_content('Report Detail')
    expect(page).to have_content("Recent Reports")
  end
end

feature "Admin searches for an incident" do

  scenario 'an admin searches incidents by content of event' do
    Event.create(submitter: "Jimmy", details: "She said I'm fat.", date: "2011-12-09")

    visit "admins/dashboard"
    fill_in "search", :with => "fat"
    click_button("search")

    expect(page).to have_content("2011-12-09")
  end
end
