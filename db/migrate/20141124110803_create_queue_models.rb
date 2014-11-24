class CreateQueueModels < ActiveRecord::Migration
  def change
    create_table :queue_models do |t|
      t.string :name
      t.float :gps_lon
      t.float :gps_lat
      t.text :description
      t.string :image
      t.integer :num_customer
      t.integer :last_customer
      t.float :average_time

      t.timestamps
    end
  end
end
