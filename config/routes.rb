Rails.application.routes.draw do
  get 'purchase_items/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :purchases, only: [:new,:create,:index, :show] do
  	resources :purchase_items, only: [:index]
  end

  resources :carts, except: [:destroy, :index] do
  	resources :cart_items, except: [:show]
  end
  resources :pro_genres, only: [:show] do
  	resources :products, only: [:show, :new, :update, :edit, :create]do
  		resources :reviews, except: [:destroy, :index]
  	end
  end

  root 'pro_genres#index'
  get  '/products/index' => 'products#index' #管理者用のindex
  get '/pro_genres/research' => 'pro_genres#research'
end
