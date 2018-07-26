Rails.application.routes.draw do
  # get 'topics/index'
  #
  # get 'topics/show'
  #
  # get 'topics/new'
  #
  # get 'topics/edit'

  resources :topics do
    resources :bookmarks
  end

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
