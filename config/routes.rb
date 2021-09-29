Rails.application.routes.draw do
  resources :words, only: %i[index new create] # [ :index :new :create ]
end
