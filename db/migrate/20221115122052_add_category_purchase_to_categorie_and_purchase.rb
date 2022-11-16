class AddCategoryPurchaseToCategorieAndPurchase < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_purchases, :categories , null: false, foreign_key: true
    add_reference :category_purchases, :purchases , null: false, foreign_key: true
  end
end
