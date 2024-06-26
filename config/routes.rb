Rails.application.routes.draw do
  get 'categories/index'
  resources :groups
  get '/dashbord' => 'home#index'
  get '/search-group' => 'home#search_group', :as => :search_group
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
