require 'test_helper'

class ConvocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @convocation = convocations(:one)
  end

  test "should get index" do
    get convocations_url
    assert_response :success
  end

  test "should get new" do
    get new_convocation_url
    assert_response :success
  end

  test "should create convocation" do
    assert_difference('Convocation.count') do
      post convocations_url, params: { convocation: { cni: @convocation.cni, emploi: @convocation.emploi, immatriculation: @convocation.immatriculation, motif: @convocation.motif, name: @convocation.name, observation: @convocation.observation, phone: @convocation.phone, pieceretenue: @convocation.pieceretenue, prenom: @convocation.prenom, residence: @convocation.residence } }
    end

    assert_redirected_to convocation_url(Convocation.last)
  end

  test "should show convocation" do
    get convocation_url(@convocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_convocation_url(@convocation)
    assert_response :success
  end

  test "should update convocation" do
    patch convocation_url(@convocation), params: { convocation: { cni: @convocation.cni, emploi: @convocation.emploi, immatriculation: @convocation.immatriculation, motif: @convocation.motif, name: @convocation.name, observation: @convocation.observation, phone: @convocation.phone, pieceretenue: @convocation.pieceretenue, prenom: @convocation.prenom, residence: @convocation.residence } }
    assert_redirected_to convocation_url(@convocation)
  end

  test "should destroy convocation" do
    assert_difference('Convocation.count', -1) do
      delete convocation_url(@convocation)
    end

    assert_redirected_to convocations_url
  end
end
