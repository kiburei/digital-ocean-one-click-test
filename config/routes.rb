Rails.application.routes.draw do
<<<<<<< HEAD
  resources :homes
  get 'home/index'

  root 'home#index'
=======
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  devise_for :hotels, :controllers => { registrations: 'registrations' }
  devise_for :installs
  resources :facilities do
    resources :bookings
  end
  resources :photos

  devise_scope :hotel do
    get "show/:id" => "registrations#show", as: :hotel
  end

  get "category", to: "facilities#category"

  post "filter", to: "facilities#filter"

  get "results", to: "facilities#results"

  get "booking/:id" => "facilities#new_booking", as: :new_booking

  get "user_bookings" => "bookings#user_bookings", as: :user_bookings

  get "reserve/:id" => "bookings#reserve", as: :reserve

  root 'facilities#index'

  get 'static/index'

  get 'static/categories'

  get 'static/facility_category_list'

  get 'static/single_facility'

  get 'static/add_facility'

  get 'static/login_page'

  get 'static/register_page'

  get 'static/profile'

  get 'static/contact_us'


>>>>>>> 579008f5a1fa7d91706bb5a73fe21633a4510a94
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
