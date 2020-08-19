class ArticlesController < ApplicationController
  before_action :require_user

  def new
    @article = Article.new
  end

  def index
    # index
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created!'
      redirect_to @article
    else
      flash[:alert] = 'An error occured'
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
