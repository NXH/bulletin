class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :nickname
      t.string :person1
      t.string :person2
      t.string :person1_email
      t.string :person2_email
      t.string :password_digest
    end
  end
end
