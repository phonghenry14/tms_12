module ApplicationHelper
  def full_title(page_t = '')
    base_title = "Training app"
    if page_t.empty?
      base_title
    else
      "#{page_t} | #{base_title}"
    end
  end
end
