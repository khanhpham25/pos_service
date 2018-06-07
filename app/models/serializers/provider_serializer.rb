module Serializers
  class ProviderSerializer < Serializers::BaseSerializer
    attrs :id, :code, :name, :address, :phone, :email, :tax_code
  end
end
