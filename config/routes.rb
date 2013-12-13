Notebook::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :collections, only: [:index, :create, :update, :destroy, :show] do
      resources :notes, only: [:index, :create, :update, :destroy, :show]
    end
  end

  root :to => "home#index"

  get '/dashboard' => 'templates#index'
  get '/collections/:id' => 'templates#index'
  get '/collections/:collection_id/notes/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }
end
