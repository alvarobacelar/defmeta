class Meta < ApplicationRecord

  validates :nome, presence: true

  belongs_to :tipo, optional: true
  belongs_to :dificuldade, optional: true
  belongs_to :ganho, optional: true
  belongs_to :usuario, optional: true

  has_many :detalhamentos, dependent: :destroy
  accepts_nested_attributes_for :detalhamentos, :allow_destroy => true

  before_save :atribui_nivel
  def atribui_nivel
    ganho_matriz = Config.all
    ganho_matriz.each do |matriz|
      @val_ganho = matriz.valor_ganho
      @val_dificuldade = matriz.valor_dificuldade
      @val_tipo = matriz.valor_tipo
    end
    ganho = Ganho.find(self.ganho_id).valor_ganho
    tipo = Tipo.find(self.tipo_id).valor_tipo
    dificuldade = Dificuldade.find(self.dificuldade_id).valor_dificuldade
    self.coeficienteganho = ganho * @val_ganho
    self.coeficientetipo = tipo * @val_tipo
    self.coeficientedificuldade = dificuldade * @val_dificuldade
    self.pontuacao =  self.coeficienteganho + self.coeficientetipo + self.coeficientedificuldade
    if self.pontuacao <= 55
      self.nivel = 1
    elsif self.pontuacao > 55 && self.pontuacao <= 80
      self.nivel = 2
    elsif self.pontuacao > 80
      self.nivel = 3
    end
  end

end
