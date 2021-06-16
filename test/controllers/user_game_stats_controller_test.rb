require 'test_helper'

class UserGameStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_game_stat = user_game_stats(:one)
  end

  test "should get index" do
    get user_game_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_user_game_stat_url
    assert_response :success
  end

  test "should create user_game_stat" do
    assert_difference('UserGameStat.count') do
      post user_game_stats_url, params: { user_game_stat: {  } }
    end

    assert_redirected_to user_game_stat_url(UserGameStat.last)
  end

  test "should show user_game_stat" do
    get user_game_stat_url(@user_game_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_game_stat_url(@user_game_stat)
    assert_response :success
  end

  test "should update user_game_stat" do
    patch user_game_stat_url(@user_game_stat), params: { user_game_stat: {  } }
    assert_redirected_to user_game_stat_url(@user_game_stat)
  end

  test "should destroy user_game_stat" do
    assert_difference('UserGameStat.count', -1) do
      delete user_game_stat_url(@user_game_stat)
    end

    assert_redirected_to user_game_stats_url
  end
end
