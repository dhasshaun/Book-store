class Book < ApplicationRecord
  has_and_belongs_to_many :orders, dependent: :destroy
  validates :name, uniqueness: true
end
