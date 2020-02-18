class Account < ApplicationRecord
  has_secure_password

  belongs_to :author

  validates :email, presence: true, uniqueness: true
end
