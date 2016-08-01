Rails.application.routes.draw do

  devise_for :people, controllers: {
    registrations: 'people/registrations',
    omniauth_callbacks: 'people/omniauth_callbacks'
  }

  root 'static_pages#home'
  get 'static_pages/about',           path: '/about'
  get 'static_pages/contact',         path: '/contact'
  get 'static_pages/terms',           path: '/terms'
  get 'static_pages/policies',        path: '/policies'
  get 'static_pages/help',            path: '/help'
  get 'static_pages/trust',           path: '/trust'
  get 'static_pages/handcrafted',     path: '/handcrafted'
  get 'static_pages/weekend',         path: '/weekend'
  get 'static_pages/team_outing',     path: '/team_outing'
  get 'static_pages/elderly',         path: '/elderly'
  get 'static_pages/women_special',   path: '/women_special'
  get 'search' => 'search#show',      as: :search
  get 'enquiries/new',                path: '/enquiries'

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    get 'dashboard/activity'
    get 'dashboard/category'
    get 'dashboard/destination'
    get 'dashboard/vendor'
    get 'dashboard/enquiry'
  end

  namespace :api do
    get 'autocomplete' => 'search_autocomplete#index'    
  end

  resources :categories
  resources :destinations
  resources :galleries
  resources :people, only: [:index, :show, :destroy]
  resources :vendors

  resources :activities do
    resources :enquiries, only: [:new, :create]
    get 'enquiries', as: :queries
  end
end
