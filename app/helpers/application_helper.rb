module ApplicationHelper
  
  def gravatar_for(trader, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(trader.email.downcase)
    size = options[ :size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: trader.tradername, class: "gravatar")
  end
end
