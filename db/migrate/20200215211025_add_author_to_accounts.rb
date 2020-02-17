class AddAuthorToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :author, foreign_key: true
  end
end
