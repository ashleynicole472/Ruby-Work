class CategoriesController < ApplicationController
  protect_from_forgery
  before_action :require_admin, except: [:index, :show]
  skip_before_action :verify_authenticity_token 

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category created successfully!"
        redirect_to categories_path
      else
        render 'new'
      end
  end

  def show
  
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin)
      flash[:danger] = "Only admins have permission to this area!"
      redirect_to categories_path
    end
  end

end
