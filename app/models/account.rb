class Account < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  belongs_to :author, dependent: :destroy
end
