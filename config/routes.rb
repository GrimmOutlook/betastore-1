Betastore::Application.routes.draw do

	namespace :admin do
		resources :products
		root :to => 'products#index'
	end

	resources :products
	
  	resources :subscriptions
  	root :to => 'subscriptions#index'

  	get '/log_in'  => 'log_ins#new', as: 'log_in'
	post '/log_in'  => 'log_ins#create'
	post '/log_out' => 'log_ins#destroy', as: 'log_out'

	get '/sign_up' => 'customers#new', as: 'sign_up'
	post '/sign_up' => 'customers#create'
	# get '/sign_up' => 'customers#edit', as: 'update'
	# post '/sign_up' => 'customers#update'

	resources :orders do
    	resource :refund
	end 

	get '/forgot_password' => 'password_resets#new', as: 'forgot_password'
	post '/forgot_password' => 'password_resets#create'

	get '/reset_password/:id/:token' => 'password_resets#edit', as: 'reset_password'
	post '/reset_password/:id/:token' => 'password_resets#update'


end
