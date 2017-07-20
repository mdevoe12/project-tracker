class ProjectsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.new(project_params)
    if @project.save
      redirect_to user_project_path(@user, @project)
    else
      flash[:message] = "Project name already used"
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @projects = Project.all
  end

  def edit
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to user_project_path(@user, @project)
    else
      flash[:message] = "Project name already used"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_projects_path(@user)
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
