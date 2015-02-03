module ApplicationHelper
  def full_title(page_t = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_t.empty?
      base_title
    else
      "#{page_t} | #{base_title}"
    end
  end
end
