module ProductServices
  class ImportFromFile
    def initialize args = {}
      @file = args[:file]
      @update_stock_count = args[:update_stock_count] == "1"
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
        inventory_note = if @update_stock_count
          InventoryNote.create! inventory_date: Time.zone.now, status: 1, note: "Import from file",
            creator: User.first, balance_date: Time.zone.now
        end
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]

          next unless row["Category"] && row["Product Name"]

          code = row["Product Code"]
          product = Product.find_by code: code

          name = row["Product Name"] || (product.name if product)
          sale_price = row["Sale Price"] || (product.sale_price if product)
          initial_cost = row["Initial Price"] || (product.initial_cost if product)
          stock_count = product ? product.stock_count : 0

          category = Category.find_by! name: row["Category"]
          properties = {
            code: code,
            name: name,
            sale_price: sale_price,
            initial_cost: initial_cost,
            stock_count: stock_count,
            category_id: category.id
          }
          if @update_stock_count
            properties.merge! stock_count: row["In Stock"] || 0
          end
          in_stock = 0
          if product
            in_stock = product.stock_count
            product.update! properties
          else
            product = Product.create! properties
          end
          if @update_stock_count
            inventory_note.inventory_note_details.create! product: product,
              real_quantity: stock_count, in_stock: in_stock, amount_deviation: stock_count - in_stock,
              price_deviation: (stock_count - in_stock) * product.initial_cost
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
