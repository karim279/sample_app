module UserHelper
  	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for user
		md5_hash = Digest::MD5::hexdigest(user.email.downcase)
		link = "http://www.gravatar.com/avatar/#{md5_hash}"
		image_tag link, alt: user.name, class: "gravatar"
	end
end
