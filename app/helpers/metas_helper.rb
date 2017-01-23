module MetasHelper

  def andamento(id)
    conta_detalhamento = Detalhamento.where(meta_id: id).count
    conta_concluida = Detalhamento.where(meta_id: id, status: true).count
    porcento_concluida = conta_concluida.to_f / conta_detalhamento.to_f * 100
  end

  def background_meta(meta)
    if meta == 3
      "background-color:  #6aa84f; color: #000;"
    elsif meta == 2
      "background-color:  #93c47d; color: #000;"
    else
      "background-color:  #d9ead3; color: #000;"
    end
  end

  def concluido(porcento)
    if porcento == 100
      "success"
    end
  end

end
