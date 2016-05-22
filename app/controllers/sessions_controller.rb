class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate
      session[:user_id] = @user.id
      redirect_to :root,:notice => "Logged in!"
    else
      flash.now.alert = "Incorrect username or password"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to :root, :notice => "Logged out!"
  end
end
