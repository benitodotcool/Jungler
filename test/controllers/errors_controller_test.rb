require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
=======
>>>>>>> dbd5b27bb95c764a2eed7463eeaff9fcbac1030b
  test "should get not_found" do
    get errors_not_found_url
    assert_response :success
  end

  test "should get unprocessable_entity" do
    get errors_unprocessable_entity_url
    assert_response :success
  end

  test "should get server_error" do
    get errors_server_error_url
    assert_response :success
  end

<<<<<<< HEAD
>>>>>>> development
=======
=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 223189ea3c306eaa65e98b84c5e821fe7048e027
>>>>>>> dbd5b27bb95c764a2eed7463eeaff9fcbac1030b
end
