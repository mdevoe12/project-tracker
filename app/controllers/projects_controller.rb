class ProjectsController < ApplicationController
  before_action :check_user

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to user_project_path(current_user, @project)
    else
      flash[:message] = "Project name already used"
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @chart = @project.pie_chart    
    @completion = @project.completion_rate
  end

  def index
    @projects = current_user.projects
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to user_project_path(current_user, @project)
    else
      flash[:message] = "Project name already used"
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_projects_path(current_user)
  end

  private

  def project_params
    params.require(:project).permit(:name, :tag_list)
  end

end
