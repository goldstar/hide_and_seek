module HideAndSeek
  class Engine < ::Rails::Engine
    isolate_namespace HideAndSeek

    config.generators do |g|
      g.test_framework  :rspec
    end

    Engine.routes.draw do
      resources :items, only: [:show, :update]
    end
  end
end
