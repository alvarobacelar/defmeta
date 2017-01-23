class ChangeColumnStatusToDetalhamentos < ActiveRecord::Migration[5.0]
  def change
	remove_column :detalhamentos, :status
	add_column :detalhamentos, :status, :boolean, default: false
  end
end
