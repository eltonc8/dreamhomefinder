class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.decimal   :lat,       null: false, index: true, precision: 18, scale: 15
      t.decimal   :lng,       null: false, index: true, precision: 18, scale: 15
      t.integer   :price,     null: false, index: true
      t.integer   :bedrooms,  null: false, index: true
      t.integer   :bathrooms, null: false, index: true
      t.integer   :sq_ft,     null: false, index: true
      t.string    :status,    null: false
      t.string    :street,    null: false
      t.string    :identity,  null: false

      t.timestamps null: false
    end
  end
end
