class TagsController < ApplicationController

  def new
    byebug
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to projects_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)

  end

end
