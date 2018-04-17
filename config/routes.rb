Rails.application.routes.draw do
  resources :collections, except: [:show]
  get 'angular-items', to: 'collections#angular'

  get 'collection/:id', to: 'collections#show', as: 'collection_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do 
    member do 
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
