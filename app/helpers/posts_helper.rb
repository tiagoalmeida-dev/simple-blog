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
    options = [:hard_wrap, :autolink, :tables, :fenced_code_blocks, :strikethrough]
    Markdown.new(text, *options).to_html.html_safe
  end

end
