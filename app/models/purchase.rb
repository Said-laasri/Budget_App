class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_purchases, dependent: :destroy
  has_many :categories, through: :category_purchases, dependent: :destroy

  validates :name, presence: true, length: { maximum: 500 }
  validates :amount, presence: true
end
