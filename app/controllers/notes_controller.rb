class NotesController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @note = Note.find(params[:id])

  end

  def new
    @project = Project.find(params[:project_id])
    @user = @project.user
    @note = Note.new
  end

  def create
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @note = @project.notes.new(note_params)

    if @note.save
      redirect_to user_project_note_path(@user, @project, @note)
    else
      flash[:message] = "Note title can't be blank"
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to user_project_note_path(@user, @project, @note)
    else
      flash[:message] = "Not valid"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to user_project_path(@user, @project)
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :status_id)
  end

end
