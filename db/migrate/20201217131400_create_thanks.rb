class CreateThanks < ActiveRecord::Migration[6.0]
  def change
    create_table :thanks do |t|
      t.string :title,     null: false
      t.references :user,  null: false, foreign_key: true
      t.references :post,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
