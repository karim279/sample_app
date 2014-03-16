class SessionsController < ApplicationController
	before_action :non_signed_in_user, only: [:new, :create]

	def new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end

	private
    def non_signed_in_user
      if signed_in?
        redirect_to root_url
      end
    end