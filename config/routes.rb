Rails.application.routes.draw do
  Hydra::BatchEdit.add_routes(self)
  mount Qa::Engine => '/authorities'
  mount Blacklight::Engine => '/'

  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users, skip: [:registrations, :passwords, :omniauth_callbacks]



  mount CollectionNorth::Engine, at: '/'
  match '/auth/:provider/callback', to: 'users/omniauth_callbacks#complete', via: [:get, :post]
  # sufia expects these routes (eg new_collection_path) to live in the host app
  match '/auth/failure', to: 'users/omniauth_callbacks#failure', via: [:get, :post]
  resources :communities, to: 'collection_north/communities'

  mount CurationConcerns::Engine, at: '/'
  resources :welcome, only: 'index'
  root 'sufia/homepage#index'
  curation_concerns_basic_routes
#  curation_concerns_collections
  curation_concerns_embargo_management
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end


  # This must be the very last route in the file because it has a catch-all route for 404 errors.
  # This behavior seems to show up only in production mode.
  mount Sufia::Engine => '/'
end
