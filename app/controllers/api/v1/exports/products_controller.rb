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
          sheet.add_row ["Product Code", "Product Name", "Category", "Sale Price", "Initial Price", "In Stock"]
          sheet.add_row ["[Blank for new/Updating Product Code]", "", "", "", "", ""]
          category_names = Category.pluck(:name).join(", ")
          sheet.add_data_validation("C2:C10", {
            :type => :list,
            :formula1 => '"'+ category_names + '"',
            :showDropDown => false,
            :showErrorMessage => true,
            :errorTitle => '',
            :error => 'Please use the dropdown selector to choose the value',
            :errorStyle => :stop,
            :showInputMessage => true,
            :prompt => '&amp; Choose category for the product'})
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
