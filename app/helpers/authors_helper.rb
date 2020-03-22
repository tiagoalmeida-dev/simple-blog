require 'digest'

module AuthorsHelper
  def load_author_avatar(email)
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}?d=#{request.base_url}/avatar.png&s=200"
  end
end
