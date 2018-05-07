class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets.as_json(only: [:id, :name, :age, :human])
  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: pet.as_json(only: [:id, :name, :age, :human]), status: :ok
    else
      render json: {ok: false, errors: "Pet no found"}, status: :not_found
    end
  end

  def create
  end

end
