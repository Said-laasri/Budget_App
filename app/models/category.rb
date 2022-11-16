class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_purchases, dependent: :delete_all, class_name: 'CategoryPurchase'
  has_many :purchases, through: :category_purchases, class_name: 'Purchase'

  validates :name, presence: true, length: { maximum: 500 }
  validates :icon, presence: true, length: { maximum: 500 }

  def category_list
    Category.where(author_id:).order(:name)
  end
end
