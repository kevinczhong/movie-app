class ActorsController < ApplicationController
  def show
    @actor = Actor.find_by(id: params["id"])
    render template: "actors/show"
  end

  def index
    @actors = Actor.all
    render template: "actors/index"
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
      gender: params["gender"],
      age: params["age"],
    )
    render json: actor.as_json
  end

  def update
    actor = Actor.find_by(id: params[:id])
    actor.update(
      first_name: params["first_name"] || actor.first_name,
      last_name: params["last_name"] || actor.last_name,
      known_for: params["known_for"] || actor.known_for,
      gender: params["gender"] || actor.gender,
      age: params["age"] || actor.age,
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
