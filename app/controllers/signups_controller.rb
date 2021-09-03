class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        signup = Signup.create!(sign_up_params)
        activity = Activity.find(signup.activity_id)
        render json: activity, status: :created
    end

    private

    def sign_up_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def record_invalid(e)
        render json: {errors:["a kind of Array"]}, status: :unprocessable_entity
    end
end
