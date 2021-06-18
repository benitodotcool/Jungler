require 'test_helper'

class LadningPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ladning_page_index_url
    assert_response :success
  end

end
