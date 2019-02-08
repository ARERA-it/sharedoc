Rails.application.routes.draw do
  resources :pages
  resources :specific_objectives
  get 'documents/:id/checkin', to: 'documents#checkin', as: :checkin
  get 'documents/:id/checkout', to: 'documents#checkout', as: :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
