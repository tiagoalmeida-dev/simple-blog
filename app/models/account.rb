class Account < ApplicationRecord
  has_secure_password

  belongs_to :author

  validates :email, presence: true, uniqueness: true
  validates_associated :author
  accepts_nested_attributes_for :author
end
