class AddPicturesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :person1_picture, :string
    add_column :accounts, :person2_picture, :string
  end
end
