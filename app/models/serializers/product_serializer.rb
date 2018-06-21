module Serializers
  class ProductSerializer < Serializers::BaseSerializer
    attrs :id, :name, :code, :sale_price, :initial_cost, :stock_count,
      :category, :is_selling, :product_attributes, :product_images, :description

    def category
      object.category
    end

    def product_attributes
      object.product_attributes
    end

    def product_images
      Serializers::ProductImageSerializer.new(object: object.product_images).serializer
    end
  end
end
