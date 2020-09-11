class CreateLockers < ActiveRecord::Migration[5.2]
  def change
    create_table :lockers do |t|
      t.string :name
      t.text :location
      
      t.timestamps
    end
  end
end
