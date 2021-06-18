require 'test_helper'

class DiscoveryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discovery_index_url
    assert_response :success
  end

end
