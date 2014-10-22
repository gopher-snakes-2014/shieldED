describe AdminsController do
    xcontext 'admins#admin_dashboard' do
      it "should render the dashboard for admin" do
        get :admin_dashboard
        expect(response).to render_template(:admin_dashboard)
      end
    end
end

#Routes are no longer accessible without logging in - Andrew
