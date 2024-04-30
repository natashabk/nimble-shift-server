class Api::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        if @users.any?
          render json: @users
        else
          render json: { message: 'No users found' }, status: :not_found
        end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end

end
