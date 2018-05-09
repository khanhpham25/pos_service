module Api
  module V1
    class GoodsReceiptNotesController < ApplicationController
      before_action :find_goods_receipt_note, only: %i[ show update destroy ]

      def index
        goods_receipt_notes = GoodsReceiptNote.all

        json_response json: {
          message: I18n.t("goods_receipt_notes.load_goods_receipt_notes_success"),
          data: {
            goods_receipt_notes: Serialiers::GoodsReceiptNoteSerializer.new(object: goods_receipt_notes)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("goods_receipt_notes.load_goods_receipt_note_success"),
          data: {
            goods_receipt_note: Serialiers::GoodsReceiptNoteSerializer.new(object: goods_receipt_note)
          },
          status: 200
        }
      end

      def create
        goods_receipt_note = GoodsReceiptNote.new goods_receipt_note_params
        if goods_receipt_note.save
          created_request_response json: {
            message: I18n.t("goods_receipt_notes.create_success"),
            data: {
              goods_receipt_note: Serialiers::GoodsReceiptNoteSerializer.new(object: goods_receipt_note)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: goods_receipt_note.errors, status: 422 }
        end
      end

      def update
        if goods_receipt_note.update_attributes goods_receipt_note_params
          json_response json: {
            message: I18n.t("goods_receipt_notes.update_success"),
            data: {
              goods_receipt_note: Serialiers::GoodsReceiptNoteSerializer.new(object: goods_receipt_note)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: goods_receipt_note.errors, status: 422
          }
        end
      end

      def destroy
        goods_receipt_note.destroy
        no_content_response json: {message: I18n.t("goods_receipt_notes.destroy_success")},
          status: :no_content
      end

      private

      attr_reader :goods_receipt_note

      def goods_receipt_note_params
        params.require(:goods_receipt_note).permit GoodsReceiptNote::ATTRIBUTES_PARAMS
      end

      def find_goods_receipt_note
        @goods_receipt_note = goods_receipt_note.find_by id: params[:id]

        return if goods_receipt_note
        not_found_response json: {
          errors: I18n.t("goods_receipt_notes.not_found_goods_receipt_note")
        }, status: :not_found
      end
    end
  end
end
