class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: { movies: movies }
  end

  def show
    movie = Movie.find_by(id: params["id"])
    render json: { movie: movie }
  end
end
