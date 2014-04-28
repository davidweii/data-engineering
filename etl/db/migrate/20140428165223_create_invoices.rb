class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :purchaser_name, null: false
      t.string :item_description, null: false
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_address, null: false
      t.string :merchant_name, null: false

      t.timestamps
    end
  end
end
