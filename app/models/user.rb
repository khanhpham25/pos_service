class User < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTES_PARAMS = %i[
    id name password phone email address status role_id
  ].freeze

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :email_downcase

  has_secure_password

  has_one :role
  has_many :receipts, foreign_key: :creator_id

  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  private

  def email_downcase
    email.downcase!
  end
end
