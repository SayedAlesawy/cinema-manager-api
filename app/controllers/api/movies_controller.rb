# frozen_string_literal: true

module Api
  class MoviesController < ApplicationController
    include MovieParams

    def create
      movie = Movie.create!(movie_params)

      render json: decorate(movie), status: 201
    end

    def decorate(movie)
      {
        name: movie.name,
        genre: movie.genre,
        duration: movie.duration
      }
    end
  end
end
