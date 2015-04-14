module HideAndSeek
  class Engine < ::Rails::Engine
    isolate_namespace HideAndSeek

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
    end

    Engine.routes.draw do
      resources :items, only: [:show, :update], param: :item_name
    end
  end
end
