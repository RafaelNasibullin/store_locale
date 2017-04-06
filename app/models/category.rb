class Category < ActiveRecord::Base
  has_many :products

  validates :name_en, presence: true, length: {maximum: 250}
  validates :name_ru, presence: true, length: {maximum: 250}
end
