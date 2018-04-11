class ApplicationController < ActionController::API
  require "authentication/jwt"
  include Response

  before_action :authenticate_request

  private

  def authenticate_request
    return if Jwt.new.authenticate?(request)
    unauthorized_response json: {errors: I18n.t("users.unauthorized")}
  end

  def record_not_found
    not_found_response json: {
      errors: I18n.t("not_found",
        model: controller_name.capitalize.singularize)
    }, status: :not_found
  end
end
