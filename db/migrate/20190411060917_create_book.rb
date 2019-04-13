class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.decimal :price
      t.boolean :is_recommended, default: false
      t.timestamps
    end
  end
end
