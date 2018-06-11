module Api
  module V1
    class ProductsController < ApplicationController
      before_action :find_product, only: %i[ show update destroy ]

      def index
        products = Product.all.order created_at: :DESC

        json_response message: I18n.t("products.load_products_success"),
          data: {
            products: Serializers::ProductSerializer.new(object: products).serializer,
            categories: Serializers::CategorySerializer.new(object: Category.all).serializer,
          },
          status: 200
      end

      def show
        json_response message: I18n.t("products.load_product_success"),
          data: {
            product: Serializers::ProductSerializer.new(object: product).serializer
          },
          status: 200
      end

      def create
        product = Product.new product_params
        if product.save
          created_request_response message: I18n.t("products.create_success"),
            data: {
              product: Serializers::ProductSerializer.new(object: product).serializer
            },
            status: 201
        else
          unprocessable_response errors: product.errors, status: 422
        end
      end

      def update
        if product.update_attributes product_params
          json_response message: I18n.t("products.update_success"),
            data: {
              product: Serializers::ProductSerializer.new(object: product).serializer
            },
            status: 200
        else
          unprocessable_response errors: product.errors, status: 422
        end
      end

      def destroy
        product.destroy
        no_content_response message: I18n.t("products.destroy_success"),
          status: 204
      end

      def delete_products
        ActiveRecord::Base.transaction do
          Product.where(id: product_params[:product_ids].split(',')).destroy_all
          {success: true}
        rescue
          {
            success: false,
          }
        end
      end

      def allow_selling_products
        ActiveRecord::Base.transaction do
          Product.where(id: product_params[:product_ids].split(',')).update_all(is_selling: true)
          {success: true}
        rescue
          {
            success: false,
          }
        end
      end

      def stop_selling_products
        ActiveRecord::Base.transaction do
          Product.where(id: product_params[:product_ids].split(',')).update_all(is_selling: false)
          {success: true}
        rescue
          {
            success: false,
          }
        end
      end

      private

      attr_reader :product

      def product_params
        params.require(:product).permit Product::ATTRIBUTES_PARAMS
      end

      def find_product
        @product = Product.find_by id: params[:id]

        return if product
        not_found_response errors: I18n.t("products.not_found_product"), status: 404
      end
    end
  end
end
