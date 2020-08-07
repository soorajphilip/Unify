
class ProfilesController < ApplicationController

	def index
		@user = current_user
		@client = Octokit::Client.new(:access_token => @user.access_token)	
		
		@repos = @client.repos(current_user, query: {type: 'owner', sort: 'asc'})
		
	end

	def new
		
	end

	def edit
		@profiles = Profile.find(params[:id])
	end

	def create
		
	end

	def show
	end

	def update
		
	end

# private
# 	def profile_params
# 		params.require(:profile).permit(:name, :phone_no,)
# 	end
end



