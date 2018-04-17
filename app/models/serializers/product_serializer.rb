module Serializers
  class ProductSerializer < Serializers::BaseSerializer
    attrs :id, :name, :code, :sale_price, :initial_cose, :stock_count
      :category, :is_selling, :product_attributes

    def product_attributes
      object.product_attributes
    end
  end
end
