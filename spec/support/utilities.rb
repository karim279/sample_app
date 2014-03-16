include ApplicationHelper
# include SessionsHelper

def valid_signin(user, options = {})
	if options[:no_capybara]
		# Sign in when not using capybara
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.hash(remember_token))
	else
		visit signin_path unless options[:no_visit]
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Sign in"
	end
end

def valid_signup(user)
	fill_in "Name", with: user.name
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	fill_in "Confirm Password", with: user.password_confirmation
end

def valid_signout(user, options = {})
	if options[:no_capybara]
		cookies.delete(:remember_token)
		user.update_attribute(:remember_token,
										User.hash(User.new_remember_token))
	else
		click_link "Sign out"
	end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.text-danger.bg-danger', text: message)
	end
end