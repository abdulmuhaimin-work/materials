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
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:succes] = "You've succesfully edit user"
      redirect_to root_path
    else
      flash[:danger] = "update failed"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username, :image)
  end
end
