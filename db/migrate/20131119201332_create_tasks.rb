class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.integer :account_id
      t.text :description
      t.integer :category_id
      t.boolean :complete
      t.boolean :person1
      t.boolean :person2
    end
  end
end
