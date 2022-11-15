class CategoriePurchase < ApplicationRecord
  belongs_to :categories, class_name: 'Categorie'
  belongs_to :purchases, class_name: 'Purchase'
end
