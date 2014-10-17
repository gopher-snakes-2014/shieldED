feature "Events" do
  scenario "should be submittable from the events/new page" do
    visit '/events/new'
    expect(page).to have_content('Record Event')

    within(".new_event") do
    	fill_in "event_details", with: "I saw mommy kissing santa claus!"
    	click_button 'Submit'
    end

    expect(page).to have_content('Thank you!')
  end
end