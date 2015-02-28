class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      #@t.string :genre#日后删除
      t.text :content
      t.references :genre, index: true
      t.timestamps null: false
    end

    add_column :articles, :views_count, :integer, default: 0
    add_index :articles, [:created_at , :views_count, :genre_id]
  end
end
