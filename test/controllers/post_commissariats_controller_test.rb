require 'test_helper'

class PostCommissariatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_commissariat = post_commissariats(:one)
  end

  test "should get index" do
    get post_commissariats_url
    assert_response :success
  end

  test "should get new" do
    get new_post_commissariat_url
    assert_response :success
  end

  test "should create post_commissariat" do
    assert_difference('PostCommissariat.count') do
      post post_commissariats_url, params: { post_commissariat: { agent_id: @post_commissariat.agent_id, commissariat_id: @post_commissariat.commissariat_id, grade_id: @post_commissariat.grade_id } }
    end

    assert_redirected_to post_commissariat_url(PostCommissariat.last)
  end

  test "should show post_commissariat" do
    get post_commissariat_url(@post_commissariat)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_commissariat_url(@post_commissariat)
    assert_response :success
  end

  test "should update post_commissariat" do
    patch post_commissariat_url(@post_commissariat), params: { post_commissariat: { agent_id: @post_commissariat.agent_id, commissariat_id: @post_commissariat.commissariat_id, grade_id: @post_commissariat.grade_id } }
    assert_redirected_to post_commissariat_url(@post_commissariat)
  end

  test "should destroy post_commissariat" do
    assert_difference('PostCommissariat.count', -1) do
      delete post_commissariat_url(@post_commissariat)
    end

    assert_redirected_to post_commissariats_url
  end
end
