class Order < ApplicationRecord
  has_and_belongs_to_many :books, dependent: :destroy

  def grand_total
    self.books.sum(:price).to_f
  end
end
