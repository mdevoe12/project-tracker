Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :notes, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:new, :create, :show]

end
