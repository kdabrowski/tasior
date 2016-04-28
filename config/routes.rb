Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trace, except: :new
    end
  end
end
