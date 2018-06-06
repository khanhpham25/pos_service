module Api
  module V1
    class AuthenticationsController < ApplicationController
      skip_before_action :authenticate_request

      def create
        user = User.find_by email: authentication_params[:email].downcase
        products = Product.all.order created_at: :DESC

        if user && user.authenticate(authentication_params[:password])
          json_response message: I18n.t("authentications.correct_credentials"),
            data: {
              user: Serializers::UserSerializer.new(object: user).serializer,
              token: Jwt.encode({user_id: user.id}),
              products: Serializers::ProductSerializer.new(object: products).serializer,
              customers: Serializers::CustomerSerializer.new(object: Customer.all).serializer,
              payment_methods: PaymentMethod.all,
            },
            status: 200
        else
          unauthorized_response errors: I18n.t("authentications.wrong_credentials"),
            status: 401
        end
      end

      private

      def authentication_params
        params.require(:authentication).permit :email, :password
      end
    end
  end
end
