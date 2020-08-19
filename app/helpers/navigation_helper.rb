module NavigationHelper
  def show_logout
    return link_to 'LOGOUT', logout_path, method: :delete, class: 'nav-link' if logged_in?
  end

  def show_login
    return link_to 'LOGIN', login_path, class: 'nav-link' unless logged_in?
  end

  def show_register
    return link_to 'REGISTER', signup_path, class: 'nav-link' unless logged_in?
  end

  def show_home
    return link_to 'HOME', root_path, class: 'nav-link font-weight-bold' if logged_in?
  end

  def create_article
    return link_to 'CREATE ARTICLE', new_article_path, class: 'nav-link' if logged_in?
  end

  def list_categories
    return render 'layouts/categories' if logged_in?
  end

  def create_category
    return link_to 'CREATE NEW CATEGORY', new_category_path, class: 'nav-link' if logged_in? && current_user.admin?
  end
end
