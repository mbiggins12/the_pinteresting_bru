Rails.application.routes.draw do

	root 'pins#index'
  devise_for :users

  resources :pins

  resources :users do
    resources :boards
  end

  resources :boards do
  	resources :pins
  end

end
