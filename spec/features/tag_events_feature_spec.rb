feature "Tags" do
  before :all do
    @event = Event.create(details: "Barney tried to cut me with a piece of paper")
    @tag = Tag.create(tag_name: "violent")
  end

  scenario "for a particular event should appear on the event's page prefaced by a #" do
    visit show_event_path id: @event.id
    expect(page).to have_content("#{@event.details}")
    expect(page).to_not have_content("##{@tag.tag_name}")

    EventTag.create(event_id: @event.id, tag_id: @tag.id)

    visit show_event_path(id: @event.id)

    expect(page).to have_content("#{@event.details}")
    expect(page).to have_content("##{@tag.tag_name}")
  end

  xscenario "can be added to events by clicking them" do
    Capybara.default_wait_time = 10

    visit show_event_path id: @event.id
    expect(page).to_not have_content("##{@tag.tag_name}")

    find("##{@tag.id}", :text => "#{@tag.tag_name}").click
    click_button "Confirm New Tags"

    expect(find('.event_tags')).to have_xpath('li')
  end
end
