module CategoryHelper
  def the_image
    if @liked_article.image
      @liked_article.image.url
    else
      redirect_to signup_path
    end
  end

  def the_title
    if @liked_article.title
      @liked_article.title
    else
      redirect_to new_article_path
    end
  end

  def the_text
    if @liked_article.text
      @liked_article.text
    else
      redirect_to new_article_path
    end
  end

  def category_img
    Category.includes(:ordered_by_most_recent).each do |category|
      subcategories = category.ordered_by_most_recent.first
      if subcategories.present?
        subcategories.image.url
      else
        return nil
      end
    end
  end

  # def category_title
  #   subcategories = category.ordered_by_most_recent.first
  #   if subcategories.present?
  #     subcategories.title
  #   else
  #     return nil
  #   end
  # end
end