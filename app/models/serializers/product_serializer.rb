module Serializers
  class ProductSerializer < Serializers::BaseSerializer
    attrs :id, :name, :code, :sale_price, :initial_cost, :stock_count,
      :category, :is_selling, :product_attributes

    def category
      object.category
    end

    def product_attributes
      object.product_attributes
    end
  end
end
