class HouseTable < ActiveRecord::Migration[5.1]
  def change
    create_table :house do |t|
      t.string :address

      t.timestamps
    end 
  end
end
