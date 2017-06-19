Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests do
    member do
     post 'appearance'
    end
  end

  resources :episodes, only: [:index, :show]

  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  get '/signup', to: 'users#new', as: 'signup'
  resources :users

end
