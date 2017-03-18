Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # DEVELOPMENT ONLY: sketches are html/css/js layouts with no logic yet,
  # the code can be reused elsewhere when backend ready
  get 'sketches/stream' => 'sketches#stream'
end
