class AddColumnNivelAndCoeficientetipoAndCoeficientedificuldadeAndCoeficienteganhoAndPontuacaoToMetas < ActiveRecord::Migration[5.0]
  def change
    add_column :metas, :nivel, :integer
    add_column :metas, :coeficientetipo, :integer
    add_column :metas, :coeficientedificuldade, :integer
    add_column :metas, :coeficienteganho, :integer
    add_column :metas, :pontuacao, :integer
  end
end
