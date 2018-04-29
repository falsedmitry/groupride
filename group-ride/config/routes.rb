Rails.application.routes.draw do
  root 'rides#index'

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout
  post 'login' => 'sessions#create'

  resources :users, only: %i(new create show)

  resources :rides do
    member do
      post :join
      post :leave
    end
  end

  resource :sessions, only: %i(new create destroy)

end
