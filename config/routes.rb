Chief::Application.routes.draw do
  resources :images, only: [:create, :index, :show, :destroy]
  resources :spots, only: [:index, :create, :show, :update]
end
