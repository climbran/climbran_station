class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :user
      t.references :article, index: true

      t.timestamps null: false
    end
    add_index :reviews, [:article_id, :created_at]
  end
end
