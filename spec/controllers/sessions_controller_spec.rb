require "rails_helper"

describe SessionsController do

  describe "GET destroy" do
    it "redirects to root page" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET create" do
    it "calls from_omniauth on User model" do
      expect(User).to receive(:from_omniauth) { double(User, id: 1) }
      get :create, provider: "facebook"
    end

    it "redirects to root page" do
      user = double(User, id: 1)
      allow(User).to receive(:from_omniauth).and_return(user)
      get :create, provider: "facebook"
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
