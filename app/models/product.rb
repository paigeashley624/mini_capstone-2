class Product < ApplicationRecord
  # validates :name, :price, :description, :quantity, presence: true
  # validates :description, length: { in: 20..500 }
  # validates :name, uniqueness: { message: "That product already exists!" }
  # validates :price, :quantity, numericality: { greater_than: 0 }
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end

  # def is_discounted?
  #   price < 300.00
  # end

  # def tax
  #   price * 0.09
  # end

  # def total
  #   price + tax
  # end
end
