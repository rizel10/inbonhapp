Rails.application.routes.draw do
  devise_for :users
  # devise_for :potential_managers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      namespace :authentication do
        post 'sign_in' => 'sessions#create'
        delete 'sign_out' => 'sessions#destroy'
      end

      resources :users, except: [:edit, :new, :destroy], shallow: true do
        member do
          put :password
          put :register_device
        end
        collection do
          post :reset_password
        end
      end

      resources :events, except: [:edit, :new]

    end
  end

end
