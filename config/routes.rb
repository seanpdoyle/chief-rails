Chief::Application.routes.draw do
  resources :images, only: [:index, :show, :destroy]
  resources :spots, only: [:index, :create, :show, :update]
  resources :uploads, only: [:create]

  resource :sign, only: [:show]
end
