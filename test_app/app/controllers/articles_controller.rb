class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  skip_before_action :verify_authenticity_token 
  #Requires that all users must be signed in to see anything other then the index and show actions
  before_action :require_user, except: [:index, :show]
  #This allows only the user signed in to be able to edit/update/delete their own articles
  before_action :require_same_user, only: [:edit, :update, :destroy]
    
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
    
  def new
    @article = Article.new
  end
  
  def edit
    
  end
  
  def create
    @article = Article.new(article_params)
    # hard coding a user, to allow the ui to post and edit articles until more ui is implimented
    # @article.user = User.last
    # @article.user = current_user
    @article.user = User.find(session[:user_id])
    if @article.save
      flash[:success] = "Article was succesfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was deleted!"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
end

  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only edit/delete your own articles"
      redirect_to articles_path
    end
  end