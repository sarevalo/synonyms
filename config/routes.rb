Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :backoffice do
        resources :words, only: %i[index update]
      end

      resources :words, only: %i[index create]
    end
  end

  post 'api/v1/auth/login', to: 'api/authentication#login'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  match '*unmatched_route', to: 'application#route_not_found', via: :all
end
