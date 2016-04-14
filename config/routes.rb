Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'discover' => 'static_pages#discover'
  get 'about' => 'static_pages#about'
  get 'feedpro' => 'static_pages#feedpro'
  get 'feedone' => 'static_pages#feedone'
  get 'feedimg' => 'static_pages#feedimg'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users do
    member do
      get :following, :followers
    end
  end
  get 'invite' => 'users#invite'

  resources :fightposts do
    resources :comments, only: [:create, :destroy]
    resources :likers, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resource :profile
  get 'tags/:tag', to: 'static_pages#home', as: :tag

  resources :users, path: '', as: 'users' do
    member do
      get :fightposts
    end
  end
end
