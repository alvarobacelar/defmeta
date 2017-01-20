class CreateGanhos < ActiveRecord::Migration[5.0]
  def change
    create_table :ganhos do |t|
      t.string :nome
      t.integer :valor_ganho
      t.string :status

      t.timestamps
    end
  end
end
