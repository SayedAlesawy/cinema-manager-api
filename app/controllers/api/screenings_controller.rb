# frozen_string_literal: true

module Api
  class ScreeningsController < ApplicationController
    include AdminAuthorizable
    include ScreeningParams

    before_action :authenticate_user
    before_action :authorized?, only: [:create]
    before_action :load_screening, only: %i[reserve seat_map_status]

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

      screening.init_seat_map

      render json: decorate(screening), status: 201
    end

    def reserve
      seat_number = params[:seat_id]

      @current_screening.reserve_seat(seat_number.to_i)

      render json: { seat_map: @current_screening.seat_map }, status: 201
    end

    def seat_map_status
      render json: { seat_map: @current_screening.seat_map }, status: 200
    end

    private

    def load_screening
      @current_screening = Screening.find(params[:id])
    end

    def decorate(screening)
      {
        id: screening.id,
        start_time: screening.start_time,
        end_time: screening.end_time,
        movie_name: screening.movie.name,
        movie_genre: screening.movie.genre,
        movie_duration: screening.movie.duration,
        screen_number: screening.screen.number
      }
    end
  end
end
