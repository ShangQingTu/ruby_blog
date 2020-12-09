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
    if @article.update(article_params)
      # redirect_to @article
      # 成功了去的路由 show
      redirect_to article_path(@article)
    else
      # 失败了　不能用redirect 只能用render, 因为redirect 　在错误之前编辑的东西就没了
      render action: :edit
    end
  end

  # GET /articles/:id/show
  def show
    @article = Article.find(params[:id])
    @article_status = @article.status
  end

  def new
    #　初始化空的article
    @article = Article.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:alert] = "删除成功"
    redirect_to articles_path(@article)
  end

  # POST /articles/create
  # 因为是表单过来的,所以是post
  def create
    @article = Article.new(article_params)

    if @article.save
      # redirect_to @article
      # 成功了去的路由
      flash[:notice] = "新增成功"
      redirect_to articles_path(@article)
    else
      flash[:alert] = "新增失败"
      render 'new'
    end
  end

  private


  # strong parameter
  def article_params
    params.require(:article).permit(:title, :text, :status)
  end
end
