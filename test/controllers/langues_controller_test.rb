require 'test_helper'

class LanguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @langue = langues(:one)
  end

  test "should get index" do
    get langues_url
    assert_response :success
  end

  test "should get new" do
    get new_langue_url
    assert_response :success
  end

  test "should create langue" do
    assert_difference('Langue.count') do
      post langues_url, params: { langue: { name: @langue.name } }
    end

    assert_redirected_to langue_url(Langue.last)
  end

  test "should show langue" do
    get langue_url(@langue)
    assert_response :success
  end

  test "should get edit" do
    get edit_langue_url(@langue)
    assert_response :success
  end

  test "should update langue" do
    patch langue_url(@langue), params: { langue: { name: @langue.name } }
    assert_redirected_to langue_url(@langue)
  end

  test "should destroy langue" do
    assert_difference('Langue.count', -1) do
      delete langue_url(@langue)
    end

    assert_redirected_to langues_url
  end
end
