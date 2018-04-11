module Serializers
  class ProductSerializer < Serializers::BaseSerializer
    attrs :id, :name, :code, :sale_price, :initial_cose, :stock_count
      :category, :is_selling

    def category
      object.category
    end
  end
end
