class CreateDificuldades < ActiveRecord::Migration[5.0]
  def change
    create_table :dificuldades do |t|
      t.string :nome
      t.integer :valor_dificuldade
      t.string :status

      t.timestamps
    end
  end
end
