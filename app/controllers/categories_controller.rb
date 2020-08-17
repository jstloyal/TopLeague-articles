class CategoriesController < ApplicationController
  before_action :require_admin, only: %i[create new edit]

  def index
    @categories = Category.all
    @liked_article = Article.highest_vote.first
    redirect_to login_path if @liked_article.nil?
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to root_path
    else
      flash.now[:alert] = 'Error! Category not created, enter a valid name'
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category name successfully updated!'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.ordered_by_most_recent
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    return unless !logged_in? || !current_user.admin?

    flash[:alert] = 'Only admins can perform this action'
    redirect_to root_path
  end
end
