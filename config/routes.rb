Ot::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}


  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  

  resources :badgeships
  resources :badges
  resources :profiles do
	resources :jobs
	resources :degrees
  end
  resources :universities
  resources :resources
  resources :networks
  
  resources :topics do
  		resources :posts
  end

  get 'topics/tag/:tag', to: 'topics#index', as: :topic_tag

  get 'resources/tag/:tag', to: 'resources#index', as: :resource_tag

  root :to => "home#index"

end
