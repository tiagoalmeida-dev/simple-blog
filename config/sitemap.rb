# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.coffeebreak.fun"

SitemapGenerator::Sitemap.create do

     add posts_path, :priority => 0.7, :changefreq => 'daily'

     Post.find_each do |post|
       add post_path(post.slug), :lastmod => post.updated_at
     end

     Author.find_each do |author|
      add author_path(author.id), :lastmod => author.updated_at
    end
end
