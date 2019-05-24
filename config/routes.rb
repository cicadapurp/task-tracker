Rails.application.routes.draw do
root 'boards#index'

resources :boards do
resources :tasks
end
resources :tasks do
resources :lists
  end
end
