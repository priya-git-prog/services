Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'api/v1/index' => 'news#index', :as => 'index'


  namespace :api do
    namespace :v1 do
      resources :news do
        get :index, on: :collection
      end
    end
  end
end