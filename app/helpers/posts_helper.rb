require 'redcarpet'

module PostsHelper

  def pretty_date(date)
    date.strftime("%d %b, %Y")
  end

  def limit_text(text, max=450, sulfix="...")
    if text.size <= max
      return text
    end

    text.slice(0, max) + sulfix
  end

  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    sanitize markdown.render(text)
  end

end
