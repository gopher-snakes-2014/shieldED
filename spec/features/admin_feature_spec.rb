feature "Admin visits dashboard" do

  scenario 'an admin visits admin page' do
    # @incidents = ["a","b","c","d","e","f","g"] add these when merged with models
    # @incidents.first.date = "2013-19-22"
    visit "users/admins/dashboard"
    expect(page).to have_content('Report Detail')
    expect(page).to have_content("Recent Reports")
  end
end

feature "Admin searches for an incident" do

  scenario 'an admin searches incidents by names of involved parties' do
    Event.create(submitter: "Jimmy", details: "She said I'm fat.")
    visit "users/admins/dashboard"

    fill_in "search", :with => "fat"
    click_button("search")
    expect(page).to have_content("Jimmy")

  end
end
