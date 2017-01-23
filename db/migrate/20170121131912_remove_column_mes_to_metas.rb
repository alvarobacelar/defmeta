class RemoveColumnMesToMetas < ActiveRecord::Migration[5.0]
  def change
	remove_column :metas, :mes
  end
end
