describe EventsController do
  context 'events#new' do
  	it "should render a new event form" do
  		get :new
  		expect(response).to render_template(:_new)
  	end
  end

  context 'events#create' do
    it "should create a new event in the database linked to the current user" do
      @new_event_params = { details: "shit went down in china town" }
      expect{ post :create, event: @new_event_params }.to change{Event.count}.by(1)
    end
  end
end
