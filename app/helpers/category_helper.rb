module CategoryHelper
  def the_image
    if @liked_article.image
      @liked_article.image.url
    else
      redirect_to root_path
    end
  end

  def the_title
    if @liked_article.title
      @liked_article.title
    elsif nil?
      redirect_to root_path
    end
  end

  def the_text
    if @liked_article.text
      @liked_article.text
    elsif nil?
      redirect_to root_path
    end
  end

  def main_cat(subcategories)
    subcategories.present? ? subcategories.image.url : ''
  end

  def cat_test(subcategories)
    subcategories.present? ? subcategories.title : ''
  end
end
