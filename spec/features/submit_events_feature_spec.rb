feature "Events" do
  xscenario "should be submittable from the events/new page" do
    @user = User.create(username: "Billy")
    allow_any_instance_of(EventsController).to receive(:current_user).and_return(@user)

    visit new_event_path
    expect(page).to have_content('Event Summary')

    within(".new_event") do
    	fill_in "event_details", with: "I saw mommy kissing santa claus!"
    	click_button 'Submit'
    end

    expect(page).to have_content('Submission Received')
  end
end
