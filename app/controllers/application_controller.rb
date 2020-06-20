class AuthenticationError < StandardError

end

class ApplicationController < ActionController::API
    def current_user
        token = request.headers['Access-Token']
        raise AuthenticationError if token.nil?
        user_id = JWT.decode(token, ENV['JWT_SECRET'])[0]['user_id']
        @user = User.find_by(id: user_id)
    end
end
