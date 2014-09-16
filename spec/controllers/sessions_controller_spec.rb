require 'rails_helper'

describe SessionsController do

  describe "GET destroy" do
    it "redirects to root page" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET create" do
    it "calls from_omniauth on User model" do
      expect(User).to receive(:from_omniauth)
      get :create, provider: 'facebook'
    end

    it "redirects to root page" do
      auth_hash = OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '118181138998978630963',
        info:
        {
          email: 'test@xxxx.com',
          first_name: 'Test',
          last_name: 'User',
          name: 'Test User'
        }
      )

      allow(controller).to receive(:env).and_return('omniauth.auth' => auth_hash)
      get :create, provider: 'facebook'
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

end
