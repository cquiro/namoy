class RenameTypeColumnInRecipes < ActiveRecord::Migration
  def up
    change_table :recipes do |t|
      t.remove :type, :ingredient
      t.string :flavor
      t.text :ingredients
      t.rename :intructions, :instructions
    end
  end

  def down
    change_table :recipes do |t|
      t.remove :flavor, :ingredients
      t.string :type
      t.text :ingredient
      t.rename :instructions, :intructions
    end
  end
end
