class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to user_projects_path(@user)
    else
      flash[:notice] = "Invalid username or password, please try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
