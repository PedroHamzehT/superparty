Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create destroy] do
        collection do
          post :magic_link
        end
      end
      resources :users, only: %i[create] do
        collection do
          post :create_auth_token
        end
      end
    end
  end
end
