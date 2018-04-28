module Api
  module V1
    class AuthenticationsController < ApplicationController
      skip_before_action :authenticate_request

      def create
        user = User.find_by email: authentication_params[:email].downcase
        if user && user.authenticate(authentication_params[:password])
          json_response json: {
            message: I18n.t("authentications.correct_credentials"),
            data: {
              user: Serializers::UserSerializer.new(user),
              token: Jwt.encode({user_id: user.id})
            },
            status: 200
          }
        else
          unauthorized_response json: {errors: I18n.t("authentications.wrong_credentials")}
        end
      end

      private

      def authentication_params
        params.require(:authentication).permit :email, :password
      end
    end
  end
end
