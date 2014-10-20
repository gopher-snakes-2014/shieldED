describe TagsController do
  context 'tags#_show' do
  	it "should render a partial with all tags" do
  		get :show
  		expect(response).to render_template(:_show)
  	end
  end
end
