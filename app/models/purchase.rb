class Purchase < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :category_purchases, dependent: :delete_all, class_name: 'CategoryPurchase'
  has_many :categories, through: :category_purchases, class_name: 'Category'

  validates :name, presence: true, length: { maximum: 500 }
  validates :amount, presence: true

  def purchase_list
    Purchase.where(author_id:).order(:name)
  end
end
