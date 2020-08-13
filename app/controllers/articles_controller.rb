class ArticlesController < ApplicationController
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
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    if @article.save
      flash[:notice] = 'Article was successfully created!'
      redirect_to root_path
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
