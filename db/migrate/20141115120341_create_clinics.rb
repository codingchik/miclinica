class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :title
      t.string :category
      t.string :street
      t.string :city
      t.integer :zip
      t.string :areaserved
      t.string :openhours
      t.string :phone
      t.string :languages
      t.string :payscale
      t.integer :upvotes

      t.timestamps
    end
  end
end
