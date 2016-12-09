Rails.application.routes.draw do
  root to: 'url_convertors#index'
  post '/original_url' => 'url_convertors#visit_original_url', :as => 'visit_original_url'
  get '/short_url' => 'url_convertors#search', :as => 'search_url'
  resources :url_convertors, :only => [:new, :show, :create, :search]
end
