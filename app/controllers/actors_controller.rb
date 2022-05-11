class ActorsController < ApplicationController
  def show
    actor = Actor.find_by(id: params["id"])
    render json: actor.as_json
  end

  def index
    actors = Actor.all
    render json: actors.as_json
  end

  # def qshow
  #   actor = Actor.find_by(first_name: params["first_name"])
  #   render json: actor.as_json
  # end

  def create
    actor = Actor.create(
      first_name: params["first_name"],
      last_name: params["last_name"],
      known_for: params["known_for"],
    )
    render json: actor.as_json
  end

  def update
    actor = Actor.find_by(id: params[:id])
    actor.update(
      first_name: params["first_name"] || actor.first_name,
      last_name: params["last_name"] || actor.last_name,
      known_for: params["known_for"] || actor.known_for,
    )
    actor.save
    render json: actor.as_json
  end

  def destroy
    actor = Actor.find_by(id: params["id"])
    actor.destroy
    render json: { message: "Hasta la vista!" }
  end
end
