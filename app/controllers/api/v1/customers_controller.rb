module Api
  module V1
    class CustomersController < ApplicationController
      before_action :find_customer, only: %i[ show update destroy ]

      def index
        customers = Customer.all

        json_response message: I18n.t("customers.load_customers_success"),
          data: {
            customers: Serializers::CustomerSerializer.new(object: customers)
          },
          status: 200
      end

      def show
        json_response message: I18n.t("customers.load_customer_success"),
          data: {
            customer: Serializers::CustomerSerializer.new(object: customer)
          },
          status: 200
      end

      def create
        customer = Customer.new customer_params
        if customer.save
          created_request_response message: I18n.t("customers.create_success"),
            data: {
              customer: Serializers::CustomerSerializer.new(object: customer)
            },
            status: 201
        else
          unprocessable_response errors: customer.errors, status: 422
        end
      end

      def update
        if customer.update_attributes customer_params
          json_response message: I18n.t("customers.update_success"),
            data: {
              customer: Serializers::CustomerSerializer.new(object: customer)
            },
            status: 200
        else
          unprocessable_response errors: customer.errors, status: 422
        end
      end

      def destroy
        customer.destroy
        no_content_response message: I18n.t("customers.destroy_success"),
          status: 204
      end

      private

      attr_reader :customer

      def customer_params
        params.require(:customer).permit Customer::ATTRIBUTES_PARAMS
      end

      def find_Customer
        @customer = Customer.find_by id: params[:id]

        return if customer
        not_found_response errors: I18n.t("customers.not_found_customer"), status: 404
      end
    end
  end
end
