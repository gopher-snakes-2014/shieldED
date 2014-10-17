describe EventsController do
  context 'events#new' do
  	it "should render a new event form" do
  		get :new
  		expect(response).to render_template(:new)
  	end
  end
end
