Rails.application.routes.draw do

  devise_for :users,  path_names: { 
		sign_up: '' #Stop Sign Up
	}

  root to: "orders#index"

  resources :orders

end
