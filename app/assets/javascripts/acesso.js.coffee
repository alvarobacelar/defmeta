jQuery ->
  # SECRETARIA #############################################################################################

  # Menu
  $('.secretaria .configuracoes').hide()

  # Movimentos
  $('.secretaria.movimentos.edit [id*=movimento_descricao]').attr('disabled', true)
  $('.secretaria.movimentos.edit [id*=movimento_tipo_id]').attr('disabled', true)
  $('.secretaria.movimentos.edit [id*=movimento_data_prevista]').attr('disabled', true)
  $('.secretaria.movimentos.edit #movimento_valor_previsto').attr('disabled', true)
  $('.secretaria.movimentos.edit').find('.btn, input, select, textarea').attr('disabled', true)
  $('.secretaria.movimentos.edit .btn-danger').addClass('hide')
  $('.secretaria.movimentos.edit').find('.actions, .btn-danger').addClass('hide')
  $('.secretaria').find('.lancamentos, .fluxo-de-caixa, .dre, .plano-de-contas, .retornos, .conferencia').hide()
  

  # Contratos
  $('.secretaria.contratos.edit form.simple_form').find('input, select, button, a').attr('disabled', true)

  # Deleções
  $('.secretaria .btn-danger').hide()
  $('.secretaria.movimentos.index .btn-danger').show()
  $('.secretaria.compromissos .btn-danger').show()


  # PROFESSOR #############################################################################################

  # Menu
  # $('.professor .configuracoes').hide()
  # $('.professor .financeiro').hide()
  $('.professor .sidebar').hide(); # Consulte css que foi alterado para deixar o page-wrapper sem o espaço lateral.

  # Alunos
  $('.professor.alunos.index').find('.btn').hide()
  $('.professor.alunos.show').find('.cadastro, .contratos').hide()
  $('.professor.alunos').find('.btn').hide()

  # Turmas
  $('.professor.turmas .btn').hide()

  # Aulas
  $('.professor.aulas.edit [id*=aula_data]').attr('disabled', true)
  $('.professor.aulas.edit [id*=aula_hora]').attr('disabled', true)
  $('.professor.aulas.edit #aula_professor_id').attr('readonly', true)

  # Deleções
  $('.professor .btn-danger').hide()
  $('.professor.aulas.show .btn-danger').show()


  # DESABILITADO ##########################################################################################

  $('.nav .retornos, .nav .conferencia, .nav .contratos').hide()
#  $('.nav .configuracoes').hide()
  $('.nav .usuarios, #page-wrapper .nav .configuracoes').hide();

