class WelcomeController < ApplicationController

  has_scope :periodo

  def index
    if params[:periodo]
      @mes_referencia = params[:periodo].to_date
    else
      @mes_referencia = Date.today
    end
    # FIXME Acrescentado para evitar bugs nos dias > 28
    #       Deve ser corrigido pois pode afetar o fluxo de caixa do mês
    @mes_referencia = @mes_referencia.change(day: 1)
    data_corrente = Date.today
    params[:periodo] = l(data_corrente) unless params[:periodo]
    # @metas = Meta.periodo(Date.today).count
    @metas = apply_scopes(Meta).all.order('pontuacao DESC').count
    @todas_metas = apply_scopes(Meta).all.order('pontuacao DESC')
  end
end
