module Api
  module V1
    module Imports
      class ProductsController < ApplicationController
        def create
          result = ProductServices::ImportFromFile.new(file: params[:file],
            update_stock_count: params[:update_stock_count]).perform

          if result[:success]
            created_request_response json: {
              message: I18n.t("products.import_success"),
              status: 201
            }
          else
            unprocessable_response json: { errors: result[:message], status: 422 }
          end
        end
      end
    end
  end
end
