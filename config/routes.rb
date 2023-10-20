Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create destroy] do
        collection do
          get :magic_link
          post :create_otp
          post :confirm_otp
        end
      end

      resources :users, only: %i[create] do
        collection do
          post :create_auth_token
          post :recover_password
          post :reset_password
          get  'my_item_contributions/:contribution_id', to: 'users#my_item_contributions'
        end
      end

      resources :events do
        resources :event_guests, only: %i[index create]

        resources :contributions, only: %i[index create]
        match 'contributions', to: 'contributions#update', via: %i[put patch]
        delete 'contributions', to: 'contributions#destroy'

        resources :contribution_items, only: %i[index create update destroy] do
          resources :user_contributions, only: %i[create destroy]
        end

        resources :contribution_suggestions, only: %i[index create destroy]
      end

      resources :event_guests, only: %i[destroy] do
        collection do
          put :confirm
        end
      end
    end
  end
end
