require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe 'users-controller' do
    it 'login page exists' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
