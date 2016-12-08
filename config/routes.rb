Rails.application.routes.draw do
  root to: 'url_convertors#index'
  resources :url_convertors, :only => [:new, :show]
end
