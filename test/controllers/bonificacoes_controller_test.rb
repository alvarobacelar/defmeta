require 'test_helper'

class BonificacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bonificacao = bonificacoes(:one)
  end

  test "should get index" do
    get bonificacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_bonificacao_url
    assert_response :success
  end

  test "should create bonificacao" do
    assert_difference('Bonificacao.count') do
      post bonificacoes_url, params: { bonificacao: { alcancadon1: @bonificacao.alcancadon1, alcancadon2: @bonificacao.alcancadon2, alcancadon3: @bonificacao.alcancadon3, bnfalcancadan1: @bonificacao.bnfalcancadan1, bnfalcancadan2: @bonificacao.bnfalcancadan2, bnfalcancadan3: @bonificacao.bnfalcancadan3, pontuacaodonen1: @bonificacao.pontuacaodonen1, pontuacaodonen2: @bonificacao.pontuacaodonen2, pontuacaodonen3: @bonificacao.pontuacaodonen3, pontuacaon1: @bonificacao.pontuacaon1, pontuacaon2: @bonificacao.pontuacaon2, pontuacaon3: @bonificacao.pontuacaon3, quantidaden1: @bonificacao.quantidaden1, quantidaden2: @bonificacao.quantidaden2, quantidaden3: @bonificacao.quantidaden3, totalalcancado: @bonificacao.totalalcancado, totalbnf: @bonificacao.totalbnf, totalpontuacao: @bonificacao.totalpontuacao, totalpontuacaodone: @bonificacao.totalpontuacaodone } }
    end

    assert_redirected_to bonificacao_url(Bonificacao.last)
  end

  test "should show bonificacao" do
    get bonificacao_url(@bonificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_bonificacao_url(@bonificacao)
    assert_response :success
  end

  test "should update bonificacao" do
    patch bonificacao_url(@bonificacao), params: { bonificacao: { alcancadon1: @bonificacao.alcancadon1, alcancadon2: @bonificacao.alcancadon2, alcancadon3: @bonificacao.alcancadon3, bnfalcancadan1: @bonificacao.bnfalcancadan1, bnfalcancadan2: @bonificacao.bnfalcancadan2, bnfalcancadan3: @bonificacao.bnfalcancadan3, pontuacaodonen1: @bonificacao.pontuacaodonen1, pontuacaodonen2: @bonificacao.pontuacaodonen2, pontuacaodonen3: @bonificacao.pontuacaodonen3, pontuacaon1: @bonificacao.pontuacaon1, pontuacaon2: @bonificacao.pontuacaon2, pontuacaon3: @bonificacao.pontuacaon3, quantidaden1: @bonificacao.quantidaden1, quantidaden2: @bonificacao.quantidaden2, quantidaden3: @bonificacao.quantidaden3, totalalcancado: @bonificacao.totalalcancado, totalbnf: @bonificacao.totalbnf, totalpontuacao: @bonificacao.totalpontuacao, totalpontuacaodone: @bonificacao.totalpontuacaodone } }
    assert_redirected_to bonificacao_url(@bonificacao)
  end

  test "should destroy bonificacao" do
    assert_difference('Bonificacao.count', -1) do
      delete bonificacao_url(@bonificacao)
    end

    assert_redirected_to bonificacoes_url
  end
end
