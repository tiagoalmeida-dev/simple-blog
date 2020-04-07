require 'digest'

module AuthorsHelper
  def load_author_avatar(email, size=200)
    hash = Digest::MD5.hexdigest(email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/"
    image_src = "#{gravatar_url + hash}?s=#{size}"
  end
end
