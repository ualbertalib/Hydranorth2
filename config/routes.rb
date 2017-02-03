Rails.application.routes.draw do
  # mount Qa::Engine => '/authorities'
  mount Blacklight::Engine => '/'

  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

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

  curation_concerns_basic_routes
  curation_concerns_embargo_management

  devise_for :users
  resources :welcome, only: 'index'
  root 'hyrax/homepage#index'

  # This must be the very last route in the file because it has a catch-all route for 404 errors.
  # This behavior seems to show up only in production mode.
  mount Hyrax::Engine => '/'
end
