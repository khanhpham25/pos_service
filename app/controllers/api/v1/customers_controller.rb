module Api
  module V1
    class CustomersController < ApplicationController
      before_action :find_customer, only: %i[ show update destroy ]

      def index
        customers = Customer.all

        json_response json: {
          message: I18n.t("customers.load_customers_success"),
          data: {
            customers: Serialiers::CustomerSerializer.new(object: customers)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("customers.load_customer_success"),
          data: {
            customer: Serialiers::CustomerSerializer.new(object: customer)
          },
          status: 200
        }
      end

      def create
        customer = Customer.new customer_params
        if customer.save
          created_request_response json: {
            message: I18n.t("customers.create_success"),
            data: {
              customer: Serialiers::CustomerSerializer.new(object: customer)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: customer.errors, status: 422 }
        end
      end

      def update
        if customer.update_attributes customer_params
          json_response json: {
            message: I18n.t("customers.update_success"),
            data: {
              customer: Serialiers::CustomerSerializer.new(object: customer)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: customer.errors, status: 422
          }
        end
      end

      def destroy
        customer.destroy
        no_content_response json: {message: I18n.t("customers.destroy_success")},
          status: :no_content
      end

      private

      attr_reader :customer

      def customer_params
        params.require(:customer).permit Customer::ATTRIBUTES_PARAMS
      end

      def find_Customer
        @customer = Customer.find_by id: params[:id]

        return if customer
        not_found_response json: {
          errors: I18n.t("customers.not_found_customer")
        }, status: :not_found
      end
    end
  end
end
