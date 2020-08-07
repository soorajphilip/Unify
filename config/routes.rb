Rails.application.routes.draw do
	devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}

	devise_scope :user do
		unauthenticated do
			root 'welcomes#index', as: :unauthenticated_root
		end

		authenticated :user do
			root 'profiles#index', as: :authenticated_root
		end
	end
	
	resources :welcomes, only: [:index]
	resources :profiles
	resources :github
end
