module Api::V1
  class ApiController < ApplicationController
    # Global Methods
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(token: token)
      end
    end
  end
end