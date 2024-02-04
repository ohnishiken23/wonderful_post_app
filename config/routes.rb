Rails.application.routes.draw do
  resources :sample_articles
  # Task.7-2 articleのルーティングの実装
  resources :articles
  #*********************************
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
