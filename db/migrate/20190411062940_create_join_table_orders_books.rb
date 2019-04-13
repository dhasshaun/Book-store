class CreateJoinTableOrdersBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :orders, :books do |t|
      t.index [:order_id, :book_id]
      t.index [:book_id, :order_id]
    end
  end
end
