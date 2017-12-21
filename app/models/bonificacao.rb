class Bonificacao < ApplicationRecord
    
    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |product|
                csv << bonificacao.attributes.values_at(*column_names)
            end
        end
    end
end
