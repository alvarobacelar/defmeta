class Ganho < ApplicationRecord

  validates :nome,
  :valor_ganho,
  presence: true

  has_many :meta

end
