Chief::Application.routes.draw do
  resources :images, only: [:create, :index]
end
