Rails.application.routes.draw do


  devise_for :users

  get '/:username' => 'users#show', as: :user
  resources :users

  resources :pictures
  post '/:username/before_picture' => 'pictures#before_picture', as: :before_picture
  post '/:username/after_picture' => 'pictures#after_picture', as: :after_picture

  
  

  root 'users#index'



end
