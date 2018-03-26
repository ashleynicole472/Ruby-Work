class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  skip_before_action :verify_authenticity_token 
    
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
    @article.user = User.last
    # @article.user = User.find(session[:user_id])
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