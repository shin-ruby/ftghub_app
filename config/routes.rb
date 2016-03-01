Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'homepro' => 'static_pages#homepro'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :fightposts do
    resources :comments, only: [:create, :destroy]
    resources :likers, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resource :profile, only: [:create, :edit, :update]
  get 'tags/:tag', to: 'static_pages#home', as: :tag

  resources :users, path: '', as: 'users' do
    member do
      get :fightposts
    end
  end
end
