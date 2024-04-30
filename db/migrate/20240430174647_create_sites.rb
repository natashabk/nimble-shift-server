class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :phone
      t.string :email
      t.references :site_admin, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
