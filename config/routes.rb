Rails.application.routes.draw do
  resources :detalhamentos do
    get 'toogle_status',  on: :member
  end
  resources :metas do
    get 'detalhar',       on: :member
  end
  resources :configs
  resources :ganhos
  resources :dificuldades
  resources :tipos
  devise_for :usuarios, path_prefix: :auth
  resources :usuarios
  root to: 'welcome#index'
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
