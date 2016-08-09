Rails.application.routes.draw do

  devise_for :people, skip: [:sessions, :passwords, :confirmations, :registrations],
                      controllers: {
                        registrations: 'people/registrations',
                        omniauth_callbacks: 'people/omniauth_callbacks'
                      }

  root 'static_pages#home'
  get 'static_pages/about',           path: '/about'
  get 'static_pages/terms',           path: '/terms'
  get 'static_pages/policies',        path: '/policies'
  get 'static_pages/help',            path: '/help'
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

  match '/contact', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  as :person do
    # session handling
    get     '/login'  => 'devise/sessions#new',     as: 'new_person_session'
    post    '/login'  => 'devise/sessions#create',  as: 'person_session'
    delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_person_session'

    # joining
    get   '/join' => 'devise/registrations#new',    as: 'new_person_registration'
    post  '/join' => 'devise/registrations#create', as: 'person_registration'

    scope '/account' do
      # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_person_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'person_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_person_password'

      # confirmation
      get   '/confirm'        => 'devise/confirmations#show',   as: 'person_confirmation'
      post  '/confirm'        => 'devise/confirmations#create'
      get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_person_confirmation'

      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_person_registration'
      get '/settings' => 'devise/registrations#edit',   as: 'edit_person_registration'
      put '/settings' => 'devise/registrations#update'

      # account deletion
      delete '' => 'devise/registrations#destroy'
    end
  
  end
end
