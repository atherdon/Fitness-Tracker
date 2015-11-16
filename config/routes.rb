Rails.application.routes.draw do


  devise_for :users

  get '/:username' => 'users#show', as: :user
  resources :users
  

  root 'users#index'


end
