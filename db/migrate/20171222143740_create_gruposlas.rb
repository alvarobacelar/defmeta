class CreateGruposlas < ActiveRecord::Migration[5.0]
  def change
    create_table :gruposlas do |t|
      t.string :nome
      t.string :descricao
      t.decimal :slaaceitavel

      t.timestamps
    end
  end
end
