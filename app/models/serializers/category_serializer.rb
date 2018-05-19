module Serializers
  class CategorySerializer < Serializers::BaseSerializer
    attrs :id, :name, :parent

    def parent
      object.parent
    end
  end
end
