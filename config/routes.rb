Rails.application.routes.draw do
  # Task.7-3 20240206 Ohnishi
  root to: 'articles#index'
  #**************************
  resources :sample_articles
  # Task.7-2 articleのルーティングの実装
  resources :articles
  #*********************************
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
