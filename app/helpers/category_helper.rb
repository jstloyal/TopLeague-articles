module CategoryHelper
  def the_image
    if @liked_article.image
      @liked_article.image.url
    else
      redirect_to home_path
    end
  end

  def the_title
    if @liked_article.title
      @liked_article.title
    elsif nil?
      redirect_to home_path
    end
  end

  def the_text
    if @liked_article.text
      @liked_article.text
    elsif nil?
      redirect_to home_path
    end
  end
end
