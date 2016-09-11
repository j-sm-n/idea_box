class IdeasController < ApplicationController
  before_action :logged_in?

  def index
    @ideas = Idea.all
    # @ideas_images = IdeasImage.all
  end

  def new
    @idea = current_user.ideas.new
    @categories = Category.all
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      redirect_to user_idea_path(@idea.user_id, @idea)
    else
      flash.now[:notice] = @idea.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)

    flash[:notice] = "Idea '#{@idea.title}' Updated!"

    redirect_to user_idea_path(@idea.user_id, @idea)
  end

private
  def idea_params
    params.require(:idea).permit(:title, :body_text, :user_id, :category_id)
  end

  def logged_in?
    render file: "/public/404" unless current_user
  end
end
