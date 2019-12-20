# frozen_string_literal: true

module Api
  class ScreeningsController < ApplicationController
    include ScreeningParams

    def index
      screenings = Screening.find_each.map do |screening|
        decorate(screening)
      end

      render json: screenings, status: 200
    end

    def find
      screening = Screening.find(params[:id])

      render json: decorate(screening), status: 200
    end

    def create
      screening = Screening.create!(screening_params)

      render json: decorate(screening), status: 201
    end

    def decorate(screening)
      {
        id: screening.id,
        start_time: screening.start_time,
        end_time: screening.end_time,
        movie_id: screening.movie_id,
        screen_id: screening.screen_id
      }
    end
  end
end
