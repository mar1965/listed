Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :users, only: [:show]

  get 'about' => 'welcome#about'

  get 'welcome/index'

  #root 'welcome#index'
  root 'users#show'

end
