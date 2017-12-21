class AddColumnPeriodoToBonificacoes < ActiveRecord::Migration[5.0]
  def change
    add_column :bonificacoes, :periodo, :date
  end
end
