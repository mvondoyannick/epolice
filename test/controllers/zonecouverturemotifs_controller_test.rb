require 'test_helper'

class ZonecouverturemotifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zonecouverturemotif = zonecouverturemotifs(:one)
  end

  test "should get index" do
    get zonecouverturemotifs_url
    assert_response :success
  end

  test "should get new" do
    get new_zonecouverturemotif_url
    assert_response :success
  end

  test "should create zonecouverturemotif" do
    assert_difference('Zonecouverturemotif.count') do
      post zonecouverturemotifs_url, params: { zonecouverturemotif: { detail: @zonecouverturemotif.detail, name: @zonecouverturemotif.name } }
    end

    assert_redirected_to zonecouverturemotif_url(Zonecouverturemotif.last)
  end

  test "should show zonecouverturemotif" do
    get zonecouverturemotif_url(@zonecouverturemotif)
    assert_response :success
  end

  test "should get edit" do
    get edit_zonecouverturemotif_url(@zonecouverturemotif)
    assert_response :success
  end

  test "should update zonecouverturemotif" do
    patch zonecouverturemotif_url(@zonecouverturemotif), params: { zonecouverturemotif: { detail: @zonecouverturemotif.detail, name: @zonecouverturemotif.name } }
    assert_redirected_to zonecouverturemotif_url(@zonecouverturemotif)
  end

  test "should destroy zonecouverturemotif" do
    assert_difference('Zonecouverturemotif.count', -1) do
      delete zonecouverturemotif_url(@zonecouverturemotif)
    end

    assert_redirected_to zonecouverturemotifs_url
  end
end
