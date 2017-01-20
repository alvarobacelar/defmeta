class CreateMetas < ActiveRecord::Migration[5.0]
  def change
    create_table :metas do |t|
      t.string :nome
      t.integer :tipo_id
      t.integer :dificuldade_id
      t.integer :ganho_id
      t.integer :usuario_id

      t.timestamps
    end
  end
end
