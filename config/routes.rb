Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resources :passwords, param: :token
  resources :menus
  resources :fishing_service_infos, only: [ :show, :edit, :update ]
  resources :schedules
  resources :links

  root "ship_captain#home"
  get "ship_captain/home"
  get "ship_captain/page_edit"
  post "page_contents/update"

  get "ship_captain/safety_info_edit"

  post "micropots/create"
  post "micropots/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
