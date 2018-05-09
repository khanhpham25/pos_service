module Serializers
  class ProductAttributeSerializer < Serializers::BaseSerializer
    attrs :id, :value, :attribute, :product

    def attribute
      object.p_attribute
    end

    def product
      object.product
    end
  end
end
