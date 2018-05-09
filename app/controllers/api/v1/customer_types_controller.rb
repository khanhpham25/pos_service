module Api
  module V1
    class CustomerTypesController < ApplicationController
      before_action :find_customer_type, only: %i[ show update destroy ]

      def index
        customer_types = CustomerType.all

        json_response json: {
          message: I18n.t("customer_types.load_customer_types_success"),
          data: {
            customer_types: Serialiers::CustomerTypeSerializer
              .new(object: customer_types)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("customer_types.load_customer_type_success"),
          data: {
            customer_type: Serialiers::CustomerTypeSerializer
              .new(object: customer_type)
          },
          status: 200
        }
      end

      def create
        customer_type = CustomerType.new customer_type_params
        if customer_type.save
          created_request_response json: {
            message: I18n.t("customer_types.create_success"),
            data: {
              customer_type: Serialiers::CustomerTypeSerializer
                .new(object: customer_type)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: customer_type.errors, status: 422 }
        end
      end

      def update
        if customer_type.update_attributes customer_type_params
          json_response json: {
            message: I18n.t("customer_types.update_success"),
            data: {
              customer_type: Serialiers::CustomerTypeSerializer
                .new(object: customer_type)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: customer_type.errors, status: 422
          }
        end
      end

      def destroy
        customer_type.destroy
        no_content_response json: {
          message: I18n.t("customer_types.destroy_success")
        }, status: :no_content
      end

      private

      attr_reader :customer_type

      def customer_type_params
        params.require(:customer_type).permit customer_type::ATTRIBUTES_PARAMS
      end

      def find_customer_type
        @customer_type = CustomerType.find_by id: params[:id]

        return if customer_type
        not_found_response json: {
          errors: I18n.t("customer_types.not_found_customer_type")
        }, status: :not_found
      end
    end
  end
end
