class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "You are logged in as #{user.name}"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have logged out. Feel free to log back in!"
    redirect_to login_path
  end
end
