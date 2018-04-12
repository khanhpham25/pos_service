module Api
  module V1
    class ProductsController < ApplicationController
      before_action :find_product, only: %i[ show update destroy ]

      def index
        products = Product.all

        json_response json: {
          message: I18n.t("products.load_products_success"),
          data: {
            products: Serialiers::ProductSerializer.new(object: products)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("products.load_product_success"),
          data: {
            product: Serialiers::ProductSerializer.new(object: product)
          },
          status: 200
        }
      end

      def create
        product = Product.new product_params
        if product.save
          created_request_response json: {
            message: I18n.t("products.create_success"),
            data: {
              product: Serializers::ProductSerializer.new(object: product)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: product.errors, status: 422 }
        end
      end

      def update
        if product.update_attributes product_params
          json_response json: {
            message: I18n.t("products.update_success"),
            data: {
              product: Serializers::ProductSerializer.new(object: product)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: product.errors, status: 422
          }
        end
      end

      def destroy
        product.destroy
        no_content_response json: {message: I18n.t("products.destroy_success")},
          status: :no_content
      end

      private

      attr_reader :product

      def product_params
        params.require(:product).permit Product::ATTRIBUTES_PARAMS
      end

      def find_product
        @product = Product.find_by id: params[:id]

        return if product
        not_found_response json: {
          errors: I18n.t("products.not_found_product")
        }, status: :not_found
      end
    end
  end
end
