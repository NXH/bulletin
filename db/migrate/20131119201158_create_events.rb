class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.integer :account_id
      t.text :description
      t.text :location
      t.integer :category_id
      t.boolean :person1
      t.boolean :person2
    end
  end
end
