class PetsController < ApplicationController
  def index
    @pets = Pet.all
    # render json: @pets.as_json(only: [:id, :name, :age, :human])
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    if @pet
      render json: @pet.as_json(only: [:id, :name, :age, :human]), status: :ok
    else
      render json: {ok: false, errors: "Pet no found"}, status: :not_found
    end
  end

  def create
    @pet = Pet.new(pets_params)
    # pet = Pet.create(pets_params)

    if @pet.save
    # if @pet.valid?
      render json: {id: @pet.id}, status: :ok
    else
      render json: {ok: false, errors: @pet.errors}, status: :bad_request
    end
  end

  private

  def pets_params
    return params.require(:pet).permit(:name, :age, :human)
  end

end
