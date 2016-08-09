class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You've created a new user."
      redirect_to topics_path
    else
      flash[:danger] = @topic.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username, :image)
  end
end
