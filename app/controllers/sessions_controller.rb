class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
        if @user.role == "default"
          redirect_to user_projects_path(@user)
        else
          redirect_to admin_users_path
        end
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
