# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  # root is the default method or path where ActiveRecord::RecordNotFound
  # can be defined with check the "show" method on posts_controller.
  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check

  get "preview", to: "posts#preview"

  resources :posts, only: %i[index show create update destroy]
end
