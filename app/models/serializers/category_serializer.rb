module Serializers
  class CategorySerializer < Serializers::BaseSerializer
    attrs :id, :code, :name, :address, :customer_type

    def customer_type
      object.customer_type
    end
  end
end
