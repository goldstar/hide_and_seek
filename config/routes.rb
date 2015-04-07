HideAndSeek::Engine.routes.draw do
  resources :items, only: [:show, :update]
end
