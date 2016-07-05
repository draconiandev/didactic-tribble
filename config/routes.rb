Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/terms'
  get 'static_pages/policies'
  get 'static_pages/help'
  get 'static_pages/trust'

end
