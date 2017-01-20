class AddAtivoToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :ativo, :boolean
  end
end
