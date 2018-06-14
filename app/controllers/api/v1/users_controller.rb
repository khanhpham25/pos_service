module Api
  module V1
    class UsersController < ApplicationController
      before_action :find_user, only: %i(show update destroy)

      def index
        users = User.all.includes(:role)
        roles = Role.all
        json_response message: I18n.t("users.load_users_success"),
          data: {
            users: Serializers::UserSerializer.new(object: users).serializer,
            roles: Serializers::RoleSerializer.new(object: roles).serializer
          },
          status: 200
      end

      def create
        user = User.new user_params
        user.password = "123456"
        if user.save
          created_request_response message: I18n.t("users.create_success"),
            data: {
              user: Serializers::UserSerializer.new(object: user).serializer
            },
            status: 201
        else
          unprocessable_response errors: user.errors, status: 422
        end
      end

      def update
        if user.update_attributes user_params
          json_response message: I18n.t("users.update_success"),
            data: {
              user: Serializers::UserSerializer.new(object: user).serializer
            },
            status: 200
        else
          unprocessable_response errors: user.errors, status: 422
        end
      end

      def destroy
        user.destroy
        no_content_response message: I18n.t("customers.destroy_success"),
          status: 204
      end

      def delete_users
        ActiveRecord::Base.transaction do
          User.where(id: params[:user_ids].split(',')).destroy_all
          {success: true}
        end
      rescue
        {
          success: false
        }
      end

      private

      attr_reader :user

      def find_user
        @user = User.find_by id: params[:id]

        return if user
        not_found_response errors: I18n.t("customers.not_found_customer"), status: 404
      end

      def user_params
        params.require(:user).permit User::ATTRIBUTES_PARAMS
      end
    end
  end
end
