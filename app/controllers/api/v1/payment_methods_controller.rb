module Api
  module V1
    class PaymentMethodsController < ApplicationController
      before_action :find_payment_method, only: %i[ show update destroy ]

      def index
        payment_methods = PaymentMethod.all

        json_response message: I18n.t("payment_methods.load_payment_methods_success"),
          data: {
            payment_methods: payment_methods
          },
          status: 200
      end

      def show
        json_response message: I18n.t("payment_methods.load_payment_method_success"),
          data: {
            payment_method: payment_method
          },
          status: 200
      end

      def create
        payment_method = PaymentMethod.new payment_method_params
        if payment_method.save
          created_request_response message: I18n.t("payment_methods.create_success"),
            data: {
              payment_method: payment_method
            },
            status: 201
        else
          unprocessable_response errors: payment_method.errors, status: 422
        end
      end

      def update
        if payment_method.update_attributes payment_method_params
          json_response message: I18n.t("payment_methods.update_success"),
            data: {
              payment_method: payment_method
            },
            status: 200
        else
          unprocessable_response errors: payment_method.errors, status: 422
        end
      end

      def destroy
        payment_method.destroy
        no_content_response message: I18n.t("payment_methods.destroy_success"),
          status: 204
      end

      private

      attr_reader :payment_method

      def payment_method_params
        params.require(:payment_method).permit PaymentMethod::ATTRIBUTES_PARAMS
      end

      def find_payment_method
        @payment_method = payment_method.find_by id: params[:id]

        return if payment_method
        not_found_response errors: I18n.t("payment_methods.not_found_payment_method"),
          status: 404
      end
    end
  end
end
