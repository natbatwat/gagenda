class UsersController < ApplicationController
  def index
    @user = User.find(current_user[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    if @user.save
      redirect_to user_path(@user)
      flash[:notice] = "You successfully altered a human being!"
    end
  end

  def show
    @user = User.find(current_user[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to courses_path
    flash[:notice] = "You successfully destroyed a user."
  end

  def book
    @user = User.find(params[:id])
    @course = Course.find(params[:id])
    @user.course_id << @course.id
    redirect_to user_path(current_user)
    flash[:notice] = "You've booked a course!"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :role_id, :created_at, :course_id, :user_image, :remote_user_image_url)
  end
end
