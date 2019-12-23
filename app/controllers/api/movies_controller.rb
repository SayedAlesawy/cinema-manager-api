# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    include AdminAuthorizable
    include MovieParams

    before_action :authenticate_user
    before_action :authorized?

    def create
      movie = Movie.create!(movie_params)

      render json: decorate(movie), status: 201
    end

    private

    def decorate(movie)
      {
        id: movie.id,
        name: movie.name,
        genre: movie.genre,
        duration: movie.duration
      }
    end
  end
end
