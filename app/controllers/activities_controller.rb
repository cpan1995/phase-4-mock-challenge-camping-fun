class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    
    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activities = Activity.find(params[:id])
        activities.destroy
        head :no_content
    end


    private

    def record_not_found_message
        render json: {error: "Activity not found"}, status: :not_found
    end

    def record_invalid(e)
        render json: {errors: e.record.errors}, status: :unprocessable_entity
    end
end
