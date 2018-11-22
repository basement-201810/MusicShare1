Rails.application.routes.draw do
  get 'purchase_items/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new]

  resources :purchases, only: [:new,:create,:index, :show, :update] do
#  	resources :purchase_items, only: [:index]

  end


# do以下コメントアウト
 resources :carts, only:[:show]  #except: [:destroy, :index] do
  # 	resources :cart_items, except: [:show,:create,:update,:index,:action]
  # end

  resources :pro_genres, only: [:show] do
  	resources :products, only: [:show, :edit, :update]do
  		resources :reviews, except: [:destroy, :index]
  	end
  end

# do以下を追記
  resources :products, only: [:index, :new, :create] do
    resources :cart_items, only: [:create,:update,:destroy]
  end

  resources :products do
    collection do
      get :research
    end
  end

  
#    root 'purchases#index'
#    root 'pro_genres#index'

  get '/' => 'purchases#index', :constraints => ManagerChecker, as: 'admin_root'
  get '/' => 'pro_genres#index', as: 'root'

  # get  '/products/index' => 'products#index' #管理者用のindex

  # get '/pro_genres/research' => 'pro_genres#research'
  get '/user/:id/passchange' => 'users#passchange', as: 'passchange'

  get '/purchases/new/arigatou' =>'purchases#arigatou', as: 'arigatou'
  patch '/nonrelease/users/:id' => 'users#nonrelease'

end
