class UsersController < ApplicationController
  # protect_from_forgery
  # to get ride of redundant code => @user = User.find(params[:id])
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Asha's blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to articles_path
      flash[:success] = "Your account was update successfully!"
    else
      render 'edit'
    end
  end
  
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account!"
      redirect_to articles_path
    end
  end