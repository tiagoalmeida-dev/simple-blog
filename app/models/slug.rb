class Slug

  RULES = [
    {from: /[\s-]/, to: "-"},
    {from: /@/, to: "at"},
    {from: /&/, to: "and"}, 
    {from: /\W/, to: "-"},
    {from: /_+|-+/, to: "-"}
  ]

  def initialize(text) 
    @slug = text
  end

  def value
    RULES.reduce(@slug.strip.downcase) do |text, current| 
      text.gsub(current[:from], current[:to])
    end
  end

end