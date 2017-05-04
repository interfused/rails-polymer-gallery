class CreateMediafiles < ActiveRecord::Migration[5.0]
  def change
    create_table :mediafiles do |t|
      t.string :altText
      t.string :imgUrl
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
