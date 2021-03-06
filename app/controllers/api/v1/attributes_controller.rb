module Api
  module V1
    class AttributesController < ApplicationController
      before_action :find_attribute, only: %i[ show update destroy ]

      def index
        attributes = Attribute.all

        json_response message: I18n.t("attributes.load_attributes_success"),
          data: {
            attributes: attributes
          },
          status: 200
      end

      def show
        json_response message: I18n.t("attributes.load_attribute_success"),
          data: {
            attribute: attribute
          },
          status: 200
      end

      def create
        attribute = Attribute.new attribute_params
        if attribute.save
          created_request_response message: I18n.t("attributes.create_success"),
            data: {
              attribute: attribute
            },
            status: 201
        else
          unprocessable_response errors: attribute.errors, status: 422
        end
      end

      def update
        if attribute.update_attributes attribute_params
          json_response message: I18n.t("attributes.update_success"),
            data: {
              attribute: attribute
            },
            status: 200
        else
          unprocessable_response errors: attribute.errors, status: 422
        end
      end

      def destroy
        attribute.destroy
        no_content_response message: I18n.t("attributes.destroy_success"),
          status: 204
      end

      private

      attr_reader :attribute

      def attribute_params
        params.require(:attribute).permit Attribute::ATTRIBUTES_PARAMS
      end

      def find_attribute
        @attribute = attribute.find_by id: params[:id]

        return if attribute
        not_found_response errors: I18n.t("attributes.not_found_attribute"), status: 404
      end
    end
  end
end
