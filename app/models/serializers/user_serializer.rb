module Serializers
  class UserSerializer < Serializers::BaseSerializer
    attrs :id, :name, :email, :phone, :address, :status, :role

    def role
      object.role
    end
  end
end
