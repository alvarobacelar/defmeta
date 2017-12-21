class AddColumnStatusToMetas < ActiveRecord::Migration[5.0]
  def change
    add_column :metas, :status, :boolean
  end
end
