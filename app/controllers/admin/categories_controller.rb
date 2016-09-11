class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
    @user = current_user
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_category_path(@category)
    else
      flash.now[:notice] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] = "Categroy Deleted!"

    redirect_to admin_categories_path
  end

private
  def category_params
    params.require(:category).permit(:name)
  end
end
