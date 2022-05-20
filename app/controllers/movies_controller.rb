class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: { movies: movies }
  end

  def show
    movie = Movie.find_by(id: params["id"])
    render json: { movie: movie }
  end

  def create
    movie = Movie.create(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
      director: params["director"],
      english: params["true"],
    )
    render json: movie.as_json
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.update(
      title: params["title"] || movie.title,
      year: params["year"] || movie.year,
      plot: params["plot"] || movie.plot,
      director: params["director"],
      english: params["true"],
    )
    movie.save
    render json: movie.as_json
  end

  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.destroy
    render json: { message: "This entry has been deleted." }
  end
end
