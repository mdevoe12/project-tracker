Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users, only: [:new, :create, :show] do
  resources :projects do
    resources :notes, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end

resources :tags

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
