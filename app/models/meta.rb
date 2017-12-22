class Meta < ApplicationRecord
  
  validates :nome, presence: true
  
  belongs_to :tipo, optional: true
  belongs_to :dificuldade, optional: true
  belongs_to :ganho, optional: true
  belongs_to :usuario, optional: true
  
  scope :periodo , -> (data_referencia) { where("to_char(datameta, 'MM') = ?", data_referencia.to_date.strftime('%m')) }
  scope :com_responsavel, -> (usuario) { where(usuario_id: usuario) }
  scope :n1_todo, -> (datareferencia, nivel) { where(nivel: nivel, datameta: datareferencia.beginning_of_month..datareferencia.end_of_month) }
  scope :n1_done, -> (datareferencia, nivel) { where(nivel: nivel, status: true, datameta: datareferencia.beginning_of_month..datareferencia.end_of_month) }
  scope :metas_done_mes, -> (datareferencia) { where(status: true, datameta: datareferencia.beginning_of_month..datareferencia.end_of_month) }
  scope :metas_not_done, -> (datareferencia) { where("to_char(datameta, 'MM') = ? AND status = ?", datareferencia.to_date.strftime('%m'), false) }
  scope :meta_done, -> (datareferencia) { where("to_char(datameta, 'MM') = ? AND status = ?", datareferencia.to_date.strftime('%m'), true) }
  
  has_many :detalhamentos, dependent: :destroy
  accepts_nested_attributes_for :detalhamentos, :allow_destroy => true
  
  def self.metas_done(data)
    @metas_mes = self.periodo(data)
    @metas_mes.each do |meta|
      if self.andamento(meta.id) == 100.0
        meta.update :status => true 
      else
        meta.update :status => false
      end 
    end
    self.metas_done_mes(data).count
  end
  
  def self.andamento(id)
    conta_detalhamento = Detalhamento.where(meta_id: id).count
    conta_concluida = Detalhamento.where(meta_id: id, status: true).count
    porcento_concluida = conta_concluida.to_f / conta_detalhamento.to_f * 100
  end
  
  def self.fechar_mes(data)
    datareferencia = data.to_date
    @metas = Meta.where(datameta: datareferencia.beginning_of_month..datareferencia.end_of_month)
    @metas.each do |meta| # altera o status da meta de acordo com as metas finalizadas ou não. 
      puts "==> Valor da meta entrege #{self.andamento(meta.id)}"
      if self.andamento(meta.id) == 100.0
        meta.update :status => true      
      else 
        meta.update :status => false
      end
    end
    conta_metas_n1 = Meta.n1_todo(datareferencia, 1).count
    conta_metas_n2 = Meta.n1_todo(datareferencia, 2).count
    conta_metas_n3 = Meta.n1_todo(datareferencia, 3).count
    
    conta_metas_n1_done = Meta.n1_done(datareferencia, 1).count
    conta_metas_n2_done = Meta.n1_done(datareferencia, 2).count
    conta_metas_n3_done = Meta.n1_done(datareferencia, 3).count
    @total_metas_done = conta_metas_n3_done + conta_metas_n2_done + conta_metas_n1_done
    
    @pontuacao_n3 = conta_metas_n3_done.to_f * 6 / conta_metas_n3.to_f
    @pontuacao_n2 = conta_metas_n2_done.to_f * 3 / conta_metas_n2.to_f
    @pontuacao_n1 = conta_metas_n1_done.to_f * 1 / conta_metas_n1.to_f
    @total_bnf = @pontuacao_n3.round(2) + @pontuacao_n2.round(2) + @pontuacao_n1.round(2)
    
    @pontosn3 = conta_metas_n3 * 6
    @pontosn2 = conta_metas_n2 * 3
    @pontosn1 = conta_metas_n1 * 1
    @total_pontos = @pontosn3 + @pontosn2 + @pontosn1
    @pontos_done_n3 = conta_metas_n3_done * 6
    @pontos_done_n2 = conta_metas_n2_done * 3
    @pontos_done_n1 = conta_metas_n1_done * 1
    @total_pontos_done = @pontos_done_n3 + @pontos_done_n2 + @pontos_done_n1
    
    Bonificacao.create  quantidaden3: conta_metas_n3, quantidaden2: conta_metas_n2, quantidaden1: conta_metas_n1,
    alcancadon3: conta_metas_n3_done, alcancadon2: conta_metas_n2_done, 
    alcancadon1: conta_metas_n1_done, totalalcancado: @total_metas_done,
    bnfalcancadan3: @pontuacao_n3, bnfalcancadan2: @pontuacao_n2, 
    bnfalcancadan1: @pontuacao_n1, totalbnf: @total_bnf, pontuacaon3: @pontosn3, 
    pontuacaon2: @pontosn2, pontuacaon1: @pontosn1, totalpontuacao: @total_pontos,
    pontuacaodonen3: @pontos_done_n3, pontuacaodonen2: @pontos_done_n2, 
    pontuacaodonen1: @pontos_done_n1, totalpontuacaodone: @total_pontos_done,
    periodo: datareferencia
    
  end
  
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
