module Api
  module V1
    class ProvidersController < ApplicationController
      before_action :find_provider, only: %i[ show update destroy ]

      def index
        providers = Provider.all

        json_response message: I18n.t("providers.load_providers_success"),
          data: {
            providers: Serializers::ProviderSerializer.new(object: providers).serializer,
          },
          status: 200
      end

      def show
        json_response message: I18n.t("providers.load_provider_success"),
          data: {
            provider: Serializers::ProviderSerializer.new(object: provider).serializer,
          },
          status: 200
      end

      def create
        provider = Provider.new provider_params
        if provider.save
          created_request_response message: I18n.t("providers.create_success"),
            data: {
              provider: Serializers::ProviderSerializer.new(object: provider).serializer,
            },
            status: 201
        else
          unprocessable_response errors: provider.errors, status: 422
        end
      end

      def update
        if provider.update_attributes provider_params
          json_response message: I18n.t("providers.update_success"),
            data: {
              provider: Serializers::ProviderSerializer.new(object: provider).serializer,
            },
            status: 200
        else
          unprocessable_response errors: provider.errors, status: 422
        end
      end

      def destroy
        provider.destroy
        no_content_response message: I18n.t("providers.destroy_success"),
          status: 204
      end

      def delete_providers
        ActiveRecord::Base.transaction do
          Provider.where(id: params[:provider_ids].split(',')).destroy_all
          {success: true}
        end
      rescue
        {
          success: false
        }
      end

      private

      attr_reader :provider

      def provider_params
        params.require(:provider).permit Provider::ATTRIBUTES_PARAMS
      end

      def find_provider
        @provider = Provider.find_by id: params[:id]

        return if provider
        not_found_response errors: I18n.t("providers.not_found_provider"), status: 404
      end
    end
  end
end
