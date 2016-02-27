Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'about' => 'static_pages#about'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users do
    member do
      get :following, :followers
    end
    #resources :profiles
  end
  resources :fightposts do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :profiles, except: [:show]
  resources :likers, only: [:create, :destroy]
  get 'tags/:tag', to: 'static_pages#home', as: :tag

end
