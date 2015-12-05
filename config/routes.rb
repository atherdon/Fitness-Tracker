Rails.application.routes.draw do


  devise_for :users

  get '/:username' => 'users#show', as: :user
  resources :users

  resources :pictures

  
  

  root 'users#index'



end
