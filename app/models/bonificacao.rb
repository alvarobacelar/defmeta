class Bonificacao < ApplicationRecord
    
    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |product|
                csv << bonificacao.attributes.values_at(*column_names)
            end
        end
    end
    scope :verifica_competencia, -> (periodo) { where(periodo: periodo) }
    scope :ano_bnf, -> (ano) { where("to_char(periodo, 'YYYY') = ?", ano.to_date.strftime('%Y')) }
end
