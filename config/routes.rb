Rails.application.routes.draw do

  get ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  get ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  root "home#index"
  get '/dashboard' => 'dashboard#show', as: :dashboard

  devise_for :users
  resources :users, only: [:create]
  get ':username' =>  'users#show'
  resources :stores, only: [:show, :edit, :update]

  # DEVELOPMENT ONLY: sketches are html/css/js layouts with no logic yet,
  # the code can be reused elsewhere when backend ready
  get 'sketches/store' => 'sketches#store'
end
