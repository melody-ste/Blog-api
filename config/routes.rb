Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  resources :articles
  
  get "up" => "rails/health#show", as: :rails_health_check

end
