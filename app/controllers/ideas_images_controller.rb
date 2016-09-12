class IdeasImagesController < ApplicationController
  def new
    @ideas_image = IdeasImage.new
    @ideas = Idea.where(user_id: params[:user_id])
    @images = Image.all
  end

  def create
    @ideas_image = IdeasImage.new(ideas_image_params)

    if @ideas_image.save
      redirect_to user_idea_path(current_user, params[:ideas_image][:idea_id])
    else
      flash.now[:notice] = "Image did not save to Idea"
      render :new
    end
  end

private

  def ideas_image_params
    params.require(:ideas_image).permit(:idea_id, :image_id)
  end
end
