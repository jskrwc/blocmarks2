Rails.application.routes.draw do
  # get 'bookmarks/show'
  #
  # get 'bookmarks/new'
  #
  # get 'bookmarks/edit'

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

  post :incoming, to: 'incoming#create'
end
