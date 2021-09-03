class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper
    end

    def create
        camper = Camper.create!(camper_param)
        render json: camper, status: :created
    end


    private

    def camper_param
        params.permit(:name, :age)
    end

    def record_not_found_message
        render json: {error: "Camper not found"}, status: :not_found
    end

    def record_invalid(e)
        render json: {errors:["a kind of Array"]}, status: :unprocessable_entity
    end
end
