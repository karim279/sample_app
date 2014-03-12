include ApplicationHelper

def valid_signin(user)
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
end

Rspec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.text-danger.bg-danger', text: message)
	end
end