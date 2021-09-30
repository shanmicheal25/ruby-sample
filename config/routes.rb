Rails.application.routes.draw do
  
  root 'words#index'
  resources :words, only: %i[index new create show] # [ :index :new :create ]
end
