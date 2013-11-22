class RemovePasswordDigestFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :password_digest, :string
  end
end
