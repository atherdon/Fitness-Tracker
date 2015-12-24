Rails.application.routes.draw do


  devise_for :users

  get '/:username' => 'users#show', as: :user
  resources :users

  resources :pictures
  post '/:username/before_picture' => 'pictures#before_picture', as: :before_picture
  post '/:username/after_picture' => 'pictures#after_picture', as: :after_picture
  delete '/:username/delete_before_pic' => 'pictures#delete_before_pic', as: :delete_before_pic
  delete '/:username/delete_after_pic' => 'pictures#delete_after_pic', as: :delete_after_pic
  

  root 'users#index'



end
