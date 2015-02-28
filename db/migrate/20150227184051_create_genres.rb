class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :amount, default: 0

      t.timestamps null: false
    end
  end
end
