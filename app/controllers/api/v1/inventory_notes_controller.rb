module Api
  module V1
    class InventoryNotesController < ApplicationController
      before_action :find_invetory_note, only: %i[ show update destroy ]

      def index
        invetory_notes = InventoryNote.all

        json_response json: {
          message: I18n.t("invetory_notes.load_invetory_notes_success"),
          data: {
            invetory_notes: Serialiers::InventoryNoteSerializer.new(object: invetory_notes)
          },
          status: 200
        }
      end

      def show
        json_response json: {
          message: I18n.t("invetory_notes.load_invetory_note_success"),
          data: {
            invetory_note: Serialiers::InventoryNoteSerializer.new(object: invetory_note)
          },
          status: 200
        }
      end

      def create
        invetory_note = InventoryNote.new invetory_note_params
        if invetory_note.save
          created_request_response json: {
            message: I18n.t("invetory_notes.create_success"),
            data: {
              invetory_note: Serialiers::InventoryNoteSerializer.new(object: invetory_note)
            },
            status: 201
          }
        else
          unprocessable_response json: { errors: invetory_note.errors, status: 422 }
        end
      end

      def update
        if invetory_note.update_attributes invetory_note_params
          json_response json: {
            message: I18n.t("invetory_notes.update_success"),
            data: {
              invetory_note: Serialiers::InventoryNoteSerializer.new(object: invetory_note)
            },
            status: 200
          }
        else
          unprocessable_response json: {
            errors: invetory_note.errors, status: 422
          }
        end
      end

      def destroy
        invetory_note.destroy
        no_content_response json: {message: I18n.t("invetory_notes.destroy_success")},
          status: :no_content
      end

      private

      attr_reader :invetory_note

      def invetory_note_params
        params.require(:invetory_note).permit InventoryNote::ATTRIBUTES_PARAMS
      end

      def find_invetory_note
        @invetory_note = invetory_note.find_by id: params[:id]

        return if invetory_note
        not_found_response json: {
          errors: I18n.t("invetory_notes.not_found_invetory_note")
        }, status: :not_found
      end
    end
  end
end
