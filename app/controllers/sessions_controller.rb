class SessionsController < ApplicationController
  def destroy
    redirect_to root_path, :notice => 'Successfully Logged out'
  end

  def create
    User.from_omniauth(env['omniauth.auth'])
    redirect_to root_path, :notice => 'Successfully Logged in'
  end

  def index

  end
end
