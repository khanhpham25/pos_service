module Api
  module V1
    class ProductAttributesController < ApplicationController
      before_action :find_product_attribute, only: %i[ show update destroy ]

      def index
        product_attributes = ProductAttribute.all

        json_response json: {
          message: I18n.t("product_attributes.load_product_attributes_success"),
          data: {
            product_attribute: Serialiers::ProductAttributeSerializer
              .new(object: product_attributes)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("product_attributes.load_product_attribute_success"),
          data: {
            product_attribute: Serialiers::ProductAttributeSerializer
              .new(object: product_attribute)
          },
          status: 200
        }
      end

      def create
        product_attribute = ProductAttribute.new product_attribute_params
        if product_attribute.save
          created_request_response json: {
            message: I18n.t("product_attributes.create_success"),
            data: {
              product_attribute: Serialiers::ProductAttributeSerializer
                .new(object: product_attribute)
            },
            status: 201
          }
        else
          unprocessable_response json: {
            errors: product_attribute.errors, status: 422
          }
        end
      end

      def update
        if product_attribute.update_attributes product_attribute_params
          json_response json: {
            message: I18n.t("product_attributes.update_success"),
            data: data: {
              product_attribute: Serialiers::ProductAttributeSerializer
                .new(object: product_attribute)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: product_attribute.errors, status: 422
          }
        end
      end

      def destroy
        product_attribute.destroy
        no_content_response json: {
          message: I18n.t("product_attributes.destroy_success")
        }, status: :no_content
      end

      private

      attr_reader :product_attribute

      def product_attribute_params
        params.require(:product_attribute)
          .permit ProductAttribute::ATTRIBUTES_PARAMS
      end

      def find_product_attribute
        @product_attribute = ProductAttribute.find_by id: params[:id]

        return if product_attribute
        not_found_response json: {
          errors: I18n.t("product_attributes.not_found_product_attribute")
        }, status: :not_found
      end
    end
  end
end
