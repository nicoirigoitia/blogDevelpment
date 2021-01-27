class ArticlesController < ApplicationController
  
  
  def index
    @articles = Article.all

    @left, @right = @articles.partition.each_with_index{ |el, i| i.even? }
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy 
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to :action => :index
  end
  private 

  def article_params
    params.require(:article).permit(:title, :content)
  end

end