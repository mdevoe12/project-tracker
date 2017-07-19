class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to @user
    else
      #user doesn't exist or incorrect password
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
