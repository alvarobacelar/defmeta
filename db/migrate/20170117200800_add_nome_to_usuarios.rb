class AddNomeToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :nome, :string
  end
end
