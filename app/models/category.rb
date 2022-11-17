class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_purchases, dependent: :destroy
  has_many :purchases, through: :category_purchases

  validates :name, presence: true, length: { maximum: 500 }
  validates :icon, presence: true, length: { maximum: 500 }
end
