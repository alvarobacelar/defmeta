class CreateTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos do |t|
      t.string :nome
      t.integer :valor_tipo
      t.string :status

      t.timestamps
    end
  end
end
