module Serializers
  class ProductAttributeSerializer < Serializers::BaseSerializer
    attrs :id, :value, :attribute, :product

    def attribute
      object.attribute
    end

    def product
      object.product
    end
  end
end
