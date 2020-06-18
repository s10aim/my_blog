Rails.application.routes.draw do
  resources :favorites, only: [:index]
  resources :posts
  devise_for :users

  as :user do
    get "users/edit" => "devise/registrations#edit", as: "edit_user_registration"
    put "users" => "devise/registrations#update", as: "user_registration"
  end
end
