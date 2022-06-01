class MoviesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @movies = Movie.where(english: true)
    render template: "movies/index"
  end

  def show
    @movie = Movie.find_by(id: params["id"])
    render template: "movies/show"
  end

  def create
    movie = Movie.new(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
      director: params["director"],
      english: params["true"],
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { error_message: movie.errors.full_messages }
    end
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.update(
      title: params["title"] || movie.title,
      year: params["year"] || movie.year,
      plot: params["plot"] || movie.plot,
      director: params["director"] || movie.director,
      english: params["english"] || movie.english,
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { error_message: movie.errors.full_messages }
    end
  end

  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.destroy
    render json: { message: "This entry has been deleted." }
  end
end
