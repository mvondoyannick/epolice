require 'test_helper'

class ConstatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constat = constats(:one)
  end

  test "should get index" do
    get constats_url
    assert_response :success
  end

  test "should get new" do
    get new_constat_url
    assert_response :success
  end

  test "should create constat" do
    assert_difference('Constat.count') do
      post constats_url, params: { constat: { cni1: @constat.cni1, cni2: @constat.cni2, immatriculation1: @constat.immatriculation1, immatriculation2: @constat.immatriculation2, marque1: @constat.marque1, marque2: @constat.marque2, name1: @constat.name1, name2: @constat.name2, phone1: @constat.phone1, phone2: @constat.phone2, police1: @constat.police1, police2: @constat.police2, typeaccident_id: @constat.typeaccident_id } }
    end

    assert_redirected_to constat_url(Constat.last)
  end

  test "should show constat" do
    get constat_url(@constat)
    assert_response :success
  end

  test "should get edit" do
    get edit_constat_url(@constat)
    assert_response :success
  end

  test "should update constat" do
    patch constat_url(@constat), params: { constat: { cni1: @constat.cni1, cni2: @constat.cni2, immatriculation1: @constat.immatriculation1, immatriculation2: @constat.immatriculation2, marque1: @constat.marque1, marque2: @constat.marque2, name1: @constat.name1, name2: @constat.name2, phone1: @constat.phone1, phone2: @constat.phone2, police1: @constat.police1, police2: @constat.police2, typeaccident_id: @constat.typeaccident_id } }
    assert_redirected_to constat_url(@constat)
  end

  test "should destroy constat" do
    assert_difference('Constat.count', -1) do
      delete constat_url(@constat)
    end

    assert_redirected_to constats_url
  end
end
