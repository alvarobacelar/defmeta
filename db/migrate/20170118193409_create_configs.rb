class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.integer :valor_ganho
      t.integer :valor_dificuldade
      t.integer :valor_tipo

      t.timestamps
    end
  end
end
