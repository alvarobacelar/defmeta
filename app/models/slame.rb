class Slame < ApplicationRecord
    belongs_to :sistemasla

    scope :do_periodo , -> (data_referencia) { where("to_char(periodo, 'MM') = ?", data_referencia.to_date.strftime('%m')) }
    scope :do_mes, -> (data, id) { where("to_char(periodo, 'MM') = ? AND sistemasla_id = ?", data.to_date.strftime('%m'), id) }
end
