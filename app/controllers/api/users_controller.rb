# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    include UserParams

    def create
      User.create!(sign_up_params)

      render json: { message: 'sign_up successful' }, status: 201
    end
  end
end
