class ActorsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def show
    @actor = Actor.find_by(id: params["id"])
    render template: "actors/show"
  end

  def index
    @actors = Actor.order(:age)
    render template: "actors/index"
  end

  # def qshow
  #   actor = Actor.find_by(first_name: params["first_name"])
  #   render json: actor.as_json
  # end

  def create
    actor = Actor.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      known_for: params["known_for"],
      gender: params["gender"],
      age: params["age"],
      movie_id: params["movie_id"],
    )
    if actor.save
      render json: actor.as_json
    else
      render json: { error_message: actor.errors.full_messages }
    end
  end

  def update
    actor = Actor.find_by(id: params[:id])
    actor.update(
      first_name: params["first_name"] || actor.first_name,
      last_name: params["last_name"] || actor.last_name,
      known_for: params["known_for"] || actor.known_for,
      gender: params["gender"] || actor.gender,
      age: params["age"] || actor.age,
      movie_id: params["movie_id"] || actor.movie_id,
    )
    if actor.save
      render json: actor.as_json
    else
      render json: { error_message: actor.errors.full_messages }
    end
  end

  def destroy
    actor = Actor.find_by(id: params["id"])
    actor.destroy
    render json: { message: "Hasta la vista!" }
  end
end
