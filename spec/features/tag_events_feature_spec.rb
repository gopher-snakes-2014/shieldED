describe "Events can be tagged" do
  describe "description" do
    event = Event.create(details: "Barney tried to cut me with a piece of paper")
    tag = Tag.create(tagname: "violent")
    visit show_event_path(id: event.id)
    expect(page).to have_content("Barney")
    expect(page).to_not have_content("violent")

    EventTag.create(event_id: event.id, tag_id: tag.id)

    visit show_event_path(id: event.id)

    expect(page).to have_content("Barney")
    expect(page).to have_content("violent")
  end
end
