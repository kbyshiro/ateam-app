Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
  root 'application#not_found'
  get '/recipes',to: 'recipes#index'
end
