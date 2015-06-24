class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_to login_url, alert: "Login/password not found!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path, notice: "Session close"
  end
end
