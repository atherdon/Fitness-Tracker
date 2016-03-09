Rails.application.routes.draw do


  devise_for :users

  get '/:username' => 'users#show', as: :user
  resources :users

  resources :pictures
  post '/:username/before_picture' => 'pictures#before_picture', as: :before_picture
  post '/:username/after_picture' => 'pictures#after_picture', as: :after_picture
  delete '/:username/delete_before_pic' => 'pictures#delete_before_pic', as: :delete_before_pic
  delete '/:username/delete_after_pic' => 'pictures#delete_after_pic', as: :delete_after_pic
  post '/:username/delete_session_pic' => 'pictures#delete_session_pic', as: :delete_session_pic
  
  post '/:username/after_stats' => 'users#after_stats', as: :add_after_stats
  post '/:username/before_stats' => 'users#before_stats', as: :add_before_stats

  patch '/:username/update_after_stats' => 'users#update_after_stats', as: :update_after_stats
  patch '/:username/update_before_stats' => 'users#update_before_stats', as: :update_before_stats

  get 'typeahead/:query' => 'workout_types#typeahead'

  post '/:username/add_workout' => 'workouts#workout', as: :add_workout
  post '/:username/update_workout' => 'workouts#update_workout', as: :update_workout


  root 'users#index'



end
