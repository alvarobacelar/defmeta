class CreateDetalhamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :detalhamentos do |t|
      t.text :item
      t.integer :meta_id
      t.string :status

      t.timestamps
    end
  end
end
