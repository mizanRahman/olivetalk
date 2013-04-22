Ot::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}


  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  resources :topics do
  		resources :posts
  		resources :resources
  end

  resources :badgeships
  resources :badges
  resources :profiles do
	resources :jobs
	resources :degrees
  end
  resources :universities
  resources :resources
  resources :networks
  


  get 'topics/tag/:tag', to: 'topics#index', as: :topic_tag
  
  match 'topics/:id/approve' => 'topics#approve'

  get 'resources/tag/:tag', to: 'resources#index', as: :resource_tag

  root :to => "home#index"

end
