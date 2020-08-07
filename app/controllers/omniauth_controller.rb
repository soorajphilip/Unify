class OmniauthController < Devise::OmniauthCallbacksController

	def github
		@user = User.create_from_provider_data(request.env['omniauth.auth'])
			if @user.persisted?
				auth = request.env["omniauth.auth"]
				@user.access_token = auth.credentials.token
				@user.expires_at = auth.credentials.expires_at
				@user.refresh_token = auth.credentials.refresh_token
				@user.save!

				sign_in_and_redirect @user
				set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
			else
				flash[:error] = 'There was a problem signing you though Gitub. Please register or try signing in later.'
				redirect_to new_user_registration_url
			end
	end

	def google_oauth2
		@user = User.create_from_provider_data(request.env['omniauth.auth'])
			if @user.persisted?
				auth = request.env["omniauth.auth"]
				@user.access_token = auth.credentials.token
				@user.expires_at = auth.credentials.expires_at
				@user.refresh_token = auth.credentials.refresh_token
				@user.save!
				
				sign_in_and_redirect @user
				set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
			else
				flash[:error] = 'There was a problem signing you though google. Please register or try signing in later.'
				redirect_to new_user_registration_url
			end
	end

	def linkedin
		@user = User.create_from_provider_data(request.env['omniauth.auth'])
			if @user.persisted?	
				auth = request.env["omniauth.auth"]
				@user.access_token = auth.credentials.token
				@user.expires_at = auth.credentials.expires_at
				@user.refresh_token = auth.credentials.refresh_token
				@user.save!
				
				sign_in_and_redirect @user
				set_flash_message(:notice, :success, kind: 'Linkedin') if is_navigational_format?
			else
				flash[:error] = 'There was a problem signing you though linkedin. Please register or try signing in later.'
				redirect_to new_user_registration_url
			end
	end

	def failure
		flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
		redirect_to new_user_registration_url
	end
end
