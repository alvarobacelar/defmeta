class Gruposla < ApplicationRecord
    has_many :sistemaslas, dependent: :destroy
    
    def self.calcula_media_grupo(grupo, periodo)
        sistemas = Sistemasla.busca_sistema(grupo, periodo)
        @resultado = sistemas.collect{|i| i.sla += i.sla / sistemas.count }
        puts "#{@resultado}"
    end
    
end
