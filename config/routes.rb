Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # since comments are nested one level inside posts we ll have to use a block statement
  resources :posts do
    resources :comments
  end
  root "posts#index"

end
