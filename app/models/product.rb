class Product < ApplicationRecord
  acts_as_paranoid

  after_save :update_code

  ATTRIBUTES_PARAMS = %i(id name code sale_price initial_cost stock_count category_id is_selling description product_ids)
    .push(product_images_attributes: :image).freeze

  belongs_to :category

  has_many :product_attributes, dependent: :destroy
  has_many :goods_receipt_note_details, dependent: :destroy
  has_many :inventory_note_details, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :receipt_details, dependent: :destroy

  accepts_nested_attributes_for :product_attributes, allow_destroy: true,
    reject_if: proc{ |attributes| attributes[:attribute_id].blank? }
  accepts_nested_attributes_for :product_images, allow_destroy: true

  def update_code
    code = self.category.name.split.map(&:first).join.upcase + "#{10000 + self.id}"
    self.update_column :code, code
  end
end
