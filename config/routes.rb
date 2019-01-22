Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :back_scratchers
    end
  end

  resources :back_scratchers

  post 'authenticate', to: 'authentication#authenticate'
end
