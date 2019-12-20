# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    post 'users/sign_up' => 'users#create'
    post 'user_token' => 'user_token#create'
  end
end
