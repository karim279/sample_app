module UserHelper
  	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, options = { size: 50 })
		md5_hash = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		link = "http://www.gravatar.com/avatar/#{md5_hash}?s=#{size}"
		image_tag link, alt: user.name, class: "gravatar"
	end
end
