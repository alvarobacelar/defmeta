class CreateSistemaslas < ActiveRecord::Migration[5.0]
  def change
    create_table :sistemaslas do |t|
      t.string :nome
      t.decimal :slaaceitavel
      t.text :descricao
      t.integer :gruposla_id

      t.timestamps
    end
  end
end
