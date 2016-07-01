class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :time_ready
      t.string :quantity
      t.string :type
      t.string :ingredient
      t.text :intructions
      t.string :image

      t.timestamps null: false
    end
  end
end
