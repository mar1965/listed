Rails.application.routes.draw do
  resources :lists

  devise_for :users

  get 'about' => 'welcome#about'

  get 'welcome/index'

  root 'welcome#index'

end
