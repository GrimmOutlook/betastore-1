class PasswordResetsController < ApplicationController
	skip_before_filter :require_log_in 
	before_filter :check_token, only: [:edit, :update]

	def create
		customer = Customer.find_by(email: params[:email])
		if customer
			password_reset = customer.password_resets.build
			password_reset.save!
			CustomerMailer.password_reset(password_reset).deliver
			redirect_to log_in_path
		else
			render 'new'
		end
	end

	def update
		if @password_reset.customer.update_attributes(password: params[:password])
			redirect_to log_in_path, notice: 'Your password has been updated'
		else
			render 'edit'
		end
	end

	protected

	def check_token
		@password_reset = PasswordReset.find_by(id: params[:id])
		unless @password_reset.try(:token) == params[:token]
			redirect_to forgot_password_path, alert: 'Your link has expired, please enter your email again to get a new link'
		end
	end


end
