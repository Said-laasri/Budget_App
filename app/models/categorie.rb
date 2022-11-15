class Categorie < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :categorie_purchases, dependent: :delete_all, class_name: 'CategoriePurchase'
  has_many :purchases, through: :categorie_purchases, class_name: 'Purchase'

  validates :name, presence: true, length: { maximum: 500 }
  validates :icon, presence: true, length: { maximum: 500 }

  def categorie_list
    Categorie.where(author_id:).order(:name)
  end
end
