class Dificuldade < ApplicationRecord

  validates :nome,
            :valor_dificuldade,
            presence: true

  has_many :meta, dependent: :destroy

end
