module ApplicationHelper
  def nav_link_to(text, path, opts)
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path, opts
    end
  end
end
