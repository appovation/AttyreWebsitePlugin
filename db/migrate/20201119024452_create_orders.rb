class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :shop
      t.string :store_domain
      t.string :order_number
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :province
      t.string :country
      t.string :zip_code
      t.string :phone
      t.text :json_data
      t.boolean :email_sent, default: false
      t.timestamps
    end
  end
end
