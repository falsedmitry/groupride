Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rides#index'

  resources :users, only: %i(new create show)

  resources :rides do
    member do
      post :join
    end
  end

  resource :sessions, only: %i(new create destroy)

end
