Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  mount ActionCable.server => '/cable'

  root "home#index"

  get ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  get ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  get '/dashboard' => 'dashboard#show', as: :dashboard

  post '/stores/:id' => 'stores#show', as: :start_streaming

  resources :stores, only: [:show, :edit, :update] do
    resources :products
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [:create]
  get ':username' =>  'users#show'

  # DEVELOPMENT ONLY: sketches are html/css/js layouts with no logic yet,
  # the code can be reused elsewhere when backend ready
  get 'sketches/store' => 'sketches#store'
end
