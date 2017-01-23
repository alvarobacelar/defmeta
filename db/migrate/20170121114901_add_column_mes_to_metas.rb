class AddColumnMesToMetas < ActiveRecord::Migration[5.0]
  def change
    add_column :metas, :mes, :string
  end
end
