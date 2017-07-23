class NotesController < ApplicationController
  before_action :check_user

  def show
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])

  end

  def new
    @project = Project.find(params[:project_id])
    @note = Note.new
  end

  def create
    @project = Project.find(params[:project_id])
    @note = @project.notes.new(note_params)

    if @note.save
      redirect_to user_project_note_path(current_user, @project, @note)
    else
      flash[:message] = "Note title can't be blank"
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to user_project_note_path(current_user, @project, @note)
    else
      flash[:message] = "Not valid"
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to user_project_path(current_user, @project)
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :status_id)
  end

end
