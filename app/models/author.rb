class Author < ApplicationRecord
  has_one :account

  validates :name, presence: true
end
