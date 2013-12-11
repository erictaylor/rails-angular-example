Notebook::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :collections, only: [:index, :create, :update, :destroy, :show] do
      resources :notes, only: [:index, :create, :update, :destroy]
    end
  end

  root :to => "home#index"

  get '/dashboard' => 'templates#index'
  get '/collections/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }
end
