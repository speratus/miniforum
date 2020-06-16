class SessionsController < ApplicationController

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET'])
            render json: {token: token, user_id: user.id}
        else
            render json: {message: "Incorrect username or password"}
        end
    end

    private

    def session_params
        params.require(:session).permit(:username, :password)
    end
end
