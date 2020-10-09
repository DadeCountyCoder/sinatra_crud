class CreateOrdersTable < ActiveRecord::Migration
  def change
    create_tables :orders do |t|
      t.string :address
      t.string :item
      t.integer :item-price
      t.integer :total
    end
  end
end
