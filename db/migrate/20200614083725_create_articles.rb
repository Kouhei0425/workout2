class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content, null: false
      t.string :title, null: false
      t.string :category, null: false
      t.text :image
      t.timestamps
    end
  end
end


