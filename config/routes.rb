Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create destroy] do
        collection do
          get :magic_link
        end
      end

      resources :users, only: %i[create] do
        collection do
          post :create_auth_token
          post :recover_password
          post :reset_password
        end
      end

      resources :events do
        resources :event_guests, only: %i[index create]
      end

      resources :event_guests, only: %i[destroy] do
        collection do
          put :confirm
        end
      end
    end
  end
end
