module Serializers
  class ProductImageSerializer < Serializers::BaseSerializer
    attrs :id, :image

    def image
       Hash[:url, object.image.url]
    end
  end
end
