Rails.application.routes.draw do
  
  resources :words
  resources :app_words
  root 'words#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources: word
end
