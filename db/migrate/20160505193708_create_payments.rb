class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :paymentable, polymorphic: true, index: true
      t.belongs_to :user, index: true
      t.integer :quantity, default: 0
      t.decimal :price_per_unit
      t.string :method, limit: 15
      t.decimal :total_amount

      t.timestamps null: false
    end
  end
end
