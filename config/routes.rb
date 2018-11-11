Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :purchases, only: [:index, :show] do
  	resources :purchase_item, only: [:index]
  end

  resources :cart, except: [:destroy, :index] do
  	resources :cart_item, except: [:show]
  end
  resources :pro_genre, only: [:show] do
  	resources :product, only: [:show]do
  		resources :review,except: [:destroy, :index]
  	end
  end

  root 'pro_genre#index'
  get  '/product/index' => 'product#index' #管理者用のindex
  get '/pro_genre/research' => 'pro_genre#research'
end
