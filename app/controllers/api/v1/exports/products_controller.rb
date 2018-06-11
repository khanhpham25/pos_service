module Api
  module V1
    module Exports
      class ProductsController < ApplicationController
        require "axlsx"

        skip_before_action :authenticate_request

        def import_template
          book = Axlsx::Package.new
          workbook = book.workbook
          sheet = workbook.add_worksheet name: "Import template"
          sheet.add_row ["Mã hàng", "Tên hàng hoá", "Nhóm hàng", "Giá bán", "Giá vốn", "Tồn kho"]
          send_excel_file book
        end

        private

        def send_excel_file book
          tmp_file_path = "#{Rails.root}/tmp/#{rand(36**50).to_s(36)}.xlsx"
          book.serialize tmp_file_path
          filename = "Import template.xlsx"
          file_content = File.read(tmp_file_path)
          send_data file_content, filename: filename
          File.delete tmp_file_path
        end
      end
    end
  end
end
