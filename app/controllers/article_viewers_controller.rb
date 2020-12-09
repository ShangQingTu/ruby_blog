class ArticleViewersController < ApplicationController
  before_action :set_article

  def index
    @viewers = @article.viewers
  end

  def show
    @viewer = @article.viewers.find(params[:id])
  end

  def new
    @viewer = @article.viewers.build
  end

  def create
    @viewer = @article.viewers.build(viewer_params)
    if @viewer.save
      flash[:notice] = "新增成功"
      redirect_to article_viewers_path(@article)
    else
      flash[:alert] = "新增失败"
      render 'new'
    end
  end

  def edit
    @viewer = @article.viewers.find(params[:id])
  end

  def update
    @viewer = @article.viewers.find(params[:id])
    if @viewer.update(viewer_params)
      flash[:notice] = "更新成功"
      redirect_to article_viewers_path(@article)
    else
      flash[:alert] = "更新失败"
      render 'edit'
    end
  end
  def destroy
    @viewer = @article.viewers.find(params[:id])
    @viewer.destroy
    redirect_to article_viewers_path(@article)
  end
  protected

  def set_article
    # 必须用　article_id, 因为 id 现在默认为　viewer的
    @article = Article.find(params[:article_id])
  end

  def viewer_params
    params.require(:viewer).permit(:name)
  end
end
