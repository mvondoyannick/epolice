require 'test_helper'

class JournalControllerTest < ActionDispatch::IntegrationTest
  test "should get public" do
    get journal_public_url
    assert_response :success
  end

  test "should get private" do
    get journal_private_url
    assert_response :success
  end

end
