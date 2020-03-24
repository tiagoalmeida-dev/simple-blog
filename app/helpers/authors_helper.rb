require 'digest'

module AuthorsHelper
  def load_author_avatar(email, size=200, placeholder="avatar.png", placeholder_url=request.base_url)
    hash = Digest::MD5.hexdigest(email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/"
    image_src = "#{gravatar_url + hash}?d=#{placeholder_url + placeholder}&s=#{size}"
  end
end
