require 'spec_helper'

describe SessionsController do

  describe "GET destroy" do
    it "redirects to root page" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET create" do
    it "redirects to root page" do
      get :create, provider: 'facebook'
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
