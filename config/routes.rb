Rails.application.routes.draw do

  devise_for :users

  get 'about' => 'welcome#about'

  get 'welcome/index'

  root 'welcome#index'

end
