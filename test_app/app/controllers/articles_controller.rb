class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token 
    
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was created successfully!"
      redirect_to articles_path(@article)
    else
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @article = Article.all
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end