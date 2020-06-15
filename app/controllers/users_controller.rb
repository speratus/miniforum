class UsersController < ApplicationController

    def create
        user = User.new(user_params)

        if user.save
            render json: user_json(user)
        else
            render json: {
                message: 'Failed to create user',
                errors: user.errors.full_messages
            }
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def user_json(user)
        user.as_json(only: [:id, :name, :username, :email])
    end
end
