Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  constraints subdomain: 'www' do
  get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  get '/about' => 'static_pages#about', as: :about
  get '/contact' => 'static_pages#contact', as: :contact
  get '/terms' => 'static_pages#terms', as: :terms
  get '/donate' => 'static_pages#donate', as: :donate

  devise_for :users, controllers: {sessions: "sessions"}

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

  post '/:username/add_suggestion' => 'suggestions#add_suggestion', as: :add_suggestion

  get '/:username/workout/:id' => 'workouts#show', as: :show_workout

  post '/:username/flag_user' => 'users#flag_user', as: :flag_user 

  post '/:username/block_user' => 'users#block_user', as: :block_user 

  post '/:username/follow_user' => 'users#follow_user', as: :follow_user
  post '/:username/unfollow_user' => 'users#unfollow_user', as: :unfollow_user

  get '/page/:page' => 'users#feed', as: :feed


  authenticated :user do
    root to: "users#feed", as: :authenticated_root
  end

  unauthenticated do
    root to: "users#index"
  end



end
