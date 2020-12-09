class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # GET /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles/:id/edit
  def update
    @article = Article.find(params[:id])
    # 更新
    @article.update(article_params)
    if @article.save
      # redirect_to @article
      # 成功了去的路由
      redirect_to action: :show, id: @article
    else
      render 'new'
    end
  end

  # GET /articles/show/:id
  def show
    @article = Article.find(params[:id])
  end

  def new
    #　初始化空的article
    @article = Article.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: :index
  end

  # POST /articles/create
  # 因为是表单过来的,所以是post
  def create
    @article = Article.new(article_params)

    if @article.save
      # redirect_to @article
      # 成功了去的路由
      redirect_to action: :index
    else
      render 'new'
    end
  end

  private


  # strong parameter
  def article_params
    params.require(:article).permit(:title, :text, :status)
  end
end
