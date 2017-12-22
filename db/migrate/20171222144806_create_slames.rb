class CreateSlames < ActiveRecord::Migration[5.0]
  def change
    create_table :slames do |t|
      t.decimal :sla
      t.date :periodo
      t.integer :sistemasla_id

      t.timestamps
    end
  end
end
