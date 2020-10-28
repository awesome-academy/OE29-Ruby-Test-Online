module UsersHelper
  def gravatar_for user, size: Settings.users_helper.size
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def index_of_page object
    (object.current_page - 1) * object.limit_value + 1
  end
end
