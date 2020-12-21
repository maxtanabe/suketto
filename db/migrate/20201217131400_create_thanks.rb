class CreateThanks < ActiveRecord::Migration[6.0]
  def change
    create_table :thanks do |t|
      t.string :title,     null: false
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
