class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :require_login

    def require_login
      authenticate_token || render_unauthorized("Acces denied, please check your credentials")
    end

    def current_user
      @current_user ||= authenticate_token
    end

    private

    def render_unauthorized(message)
       errors = {errors: { message: message }}
       reder json: errors, status: :unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, _options|
        User.find_by(token: token)
      end
    end
end
