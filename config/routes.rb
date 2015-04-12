HideAndSeek::Engine.routes.draw do
  resources :items, only: [:show, :update], param: :item_name
end
