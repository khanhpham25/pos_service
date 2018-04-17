module Api
  module V1
    class ReceiptsController < ApplicationController
      before_action :find_receipt, only: %i[ show update destroy ]

      def index
        receipts = Receipt.all

        json_response json: {
          message: I18n.t("receipts.load_receipts_success"),
          data: {
            receipts: Serialiers::ReceiptSerializer.new(object: receipts)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("receipts.load_receipt_success"),
          data: {
            receipt: Serialiers::ReceiptSerializer.new(object: receipt)
          },
          status: 200
        }
      end

      def create
        receipt = Receipt.new receipt_params
        if receipt.save
          created_request_response json: {
            message: I18n.t("receipts.create_success"),
            data: {
              receipt: Serialiers::ReceiptSerializer.new(object: receipt)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: receipt.errors, status: 422 }
        end
      end

      def update
        if receipt.update_attributes receipt_params
          json_response json: {
            message: I18n.t("receipts.update_success"),
            data: data: {
              receipt: Serialiers::ReceiptSerializer.new(object: receipt)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: receipt.errors, status: 422
          }
        end
      end

      def destroy
        receipt.destroy
        no_content_response json: {message: I18n.t("receipts.destroy_success")},
          status: :no_content
      end

      private

      attr_reader :receipt

      def receipt_params
        params.require(:receipt).permit Receipt::ATTRIBUTES_PARAMS
      end

      def find_receipt
        @receipt = receipt.find_by id: params[:id]

        return if receipt
        not_found_response json: {
          errors: I18n.t("receipts.not_found_receipt")
        }, status: :not_found
      end
    end
  end
end
