feature "Events" do
  scenario "should be submittable from the events/new page" do
    @user = User.create(username: "Billy")
    allow_any_instance_of(EventsController).to receive(:current_user).and_return(@user)

    visit '/events/new'
    expect(page).to have_content('Event Summary')

    within(".new_event") do
    	fill_in "event_details", with: "I saw mommy kissing santa claus!"
    	click_button 'Submit'
    end

    expect(page).to have_content('Thank you!')
  end
end
