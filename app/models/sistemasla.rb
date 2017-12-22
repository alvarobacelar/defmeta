class Sistemasla < ApplicationRecord
    belongs_to :gruposla
    has_many :slames

    scope :busca_sistema, -> (id, periodo) { joins(:slames).select('*').where("gruposla_id = ? AND to_char(slames.periodo, 'MM') = ?", id, periodo.to_date.strftime('%m')) }
end
