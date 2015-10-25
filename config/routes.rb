Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :drivers, only: [:create, :index, :show] do
        member do
          put :status
        end
      end
    end
  end
end
