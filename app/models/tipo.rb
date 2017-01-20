class Tipo < ApplicationRecord

  validates :nome,
  :valor_tipo,
  presence: true

  has_many :meta

end
