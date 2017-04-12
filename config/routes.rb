Rails.application.routes.draw do
  get 'items/new'

  get 'users/show'

  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  get 'about' => 'welcome#about'

  get 'welcome/index'

  root 'welcome#index'

end
