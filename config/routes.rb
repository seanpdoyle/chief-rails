Spots::Application.routes.draw do
  root to: 'spots#index'
  resources :spots
end