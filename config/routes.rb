Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :drivers, only: [:create, :index, :show] do
        collection do
          get "inArea", action: :index
        end
        member do
          patch :status
        end
      end
    end
  end
end
