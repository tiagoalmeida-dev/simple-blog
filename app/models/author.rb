class Author < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :posts

  validates :name, presence: true

  validates_associated :account
  accepts_nested_attributes_for :account, update_only: true
end
