class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      flash.now[:notice] = @image.errors.full_messages.join(", ")
      render :new
    end
  end

private

  def image_params
    params.require(:image).permit(:image_url, :alt_text)
  end
end
