class CreateCategoriePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :categorie_purchases do |t|

      t.timestamps
    end
  end
end
