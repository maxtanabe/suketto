class CreatePostOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :post_orders do |t|
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
