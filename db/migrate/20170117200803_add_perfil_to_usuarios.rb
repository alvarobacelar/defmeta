class AddPerfilToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :perfil, :string
  end
end
