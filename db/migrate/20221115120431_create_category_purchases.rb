class CreateCategoryPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :category_purchases do |t|

      t.timestamps
    end
  end
end
