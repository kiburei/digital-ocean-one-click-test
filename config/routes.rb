Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }
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

  get "filter", to: "facilities#filter"

  get "booking/:id" => "facilities#new_booking", as: :new_booking

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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
