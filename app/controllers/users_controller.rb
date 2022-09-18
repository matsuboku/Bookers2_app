class UsersController < ApplicationController
  before_action :correct_user, only:[:edit, :update]
  def index
    @users = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit

    if @user == current_user
        render "edit"
    else
      redirect_to user_path
    end
  end

  def update

    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "You have updated user successfully."
    else

      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end
end
