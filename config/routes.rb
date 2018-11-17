Rails.application.routes.draw do
  get 'purchase_items/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:destroy, :new]

  resources :purchases, only: [:new,:create,:index, :show] do
  	resources :purchase_items, only: [:index]
  end

# cart_itemに[:create,:index,:action]追記
  resources :carts, except: [:destroy, :index] do
  	resources :cart_items, except: [:show,:create,:index,:action]
  end

  resources :pro_genres, only: [:show] do
  	resources :products, only: [:show, :edit, :update]do
  		resources :reviews, except: [:destroy, :index]
  	end
  end

# do以下を追記
  resources :products, only: [:index, :new, :create] do
    resources :cart_items, only: [:create]
  end

  resources :products do
    collection do
      get :research
    end
  end


  root 'pro_genres#index'
  # get  '/products/index' => 'products#index' #管理者用のindex

  # get '/pro_genres/research' => 'pro_genres#research'
  get '/user/:id/passchange' => 'users#passchange', as: 'passchange'

  get '/purchases/new/arigatou' =>'purchases#arigatou', as: 'arigatou'

end
