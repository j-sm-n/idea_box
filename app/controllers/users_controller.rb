class UsersController < ApplicationController
  def new
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:notice] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :email_address)
  end
end
