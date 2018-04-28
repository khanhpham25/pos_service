module ProductServices
  class ImportFromFile
    def initialize args = {}
      @file = args[:file]
    end

    def perform
      unless [".xls", ".xlsx"].include? File.extname(file.original_filename)
        return {
          success: false, message: I18n.t("import_from_file.extension_error")
        }
      end
      ActiveRecord::Base.transaction do
        spreadsheet = open_spreadsheet
        header = spreadsheet.row 1
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          code = row["Product Code"]
          name = row["Product Name"]
          sale_price = row["Sale Price"]
          initial_cost = row["Initial Price"]
          stock_count = row["In Stock"]

          next unless row["Category"] && row["Product Name"]
          category = Category.find_by! name: row["Category"]
          properties = {
            code: code,
            name: name,
            sale_price: sale_price,
            initial_cost: initial_cost,
            stock_count: stock_count,
            category_id: category.id
          }
          # if <Cap nhat ton kho>
          #   # TODO: Lap phieu kiem kho
          # end
          product = Product.find_by code: code
          if product
            product.update! properties
          else
            Product.create! properties
          end
        end
      end
      {success: true}
    # rescue
    #   {
    #     success: false,
    #     message: I18n.t("products.import_failed")
    #   }
    end

    private

    attr_reader :file

    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise Exception
      end
    end
  end
end
