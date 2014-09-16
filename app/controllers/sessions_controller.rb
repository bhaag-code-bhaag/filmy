class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Logged out"
  end

  def create
    user              = User.from_omniauth(auth_params)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Successfully Logged in"
  end

  def index
  end

  private

    # TODO: "add specs for strong params", "2013-09-19"
    def auth_params
      params = ActionController::Parameters.new(env["omniauth.auth"])
      Hashie::Mash.new params.permit(:uid, :provider, info: [:name, :email])
    end
end
