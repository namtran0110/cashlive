Rails.application.routes.draw do

  root "home#index"

  devise_for :users
  resources :users, only: [:show, :create]
  resources :stores, only: [:show, :edit, :update]

  # DEVELOPMENT ONLY: sketches are html/css/js layouts with no logic yet,
  # the code can be reused elsewhere when backend ready
  get 'sketches/store' => 'sketches#store'
end
