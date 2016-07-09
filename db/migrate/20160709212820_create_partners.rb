class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :country
      t.string :city
      t.string :logo
      t.string :instagram
      t.string :facebook
      t.string :website

      t.timestamps null: false
    end
  end
end
