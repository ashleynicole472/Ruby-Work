class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  skip_before_action :verify_authenticity_token 
    
  def index
    @articles = Article.all
  end
    
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  def destroy
    
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article was deleted"
  end
  
  def edit
    
  end
  
  def update
    
    if @article.update(article_params)
      flash[:notice] = "Successfully updated!"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
end