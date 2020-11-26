class Add < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :product_title, :string
  end
end
