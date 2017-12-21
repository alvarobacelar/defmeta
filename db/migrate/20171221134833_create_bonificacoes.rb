class CreateBonificacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :bonificacoes do |t|
      t.integer :quantidaden3
      t.integer :quantidaden2
      t.integer :quantidaden1
      t.integer :alcancadon3
      t.integer :alcancadon2
      t.integer :alcancadon1
      t.integer :totalalcancado
      t.float :bnfalcancadan3
      t.float :bnfalcancadan2
      t.float :bnfalcancadan1
      t.float :totalbnf
      t.integer :pontuacaon3
      t.integer :pontuacaon2
      t.integer :pontuacaon1
      t.integer :totalpontuacao
      t.integer :pontuacaodonen3
      t.integer :pontuacaodonen2
      t.integer :pontuacaodonen1
      t.integer :totalpontuacaodone

      t.timestamps
    end
  end
end
