Rails.application.routes.draw do
  devise_for :installs
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
