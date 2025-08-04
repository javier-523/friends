require "test_helper"

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend = friends(:one)
  end

  test "should get index" do
    get friends_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_url
    assert_response :success
  end

  test "should create friend" do
    assert_difference("Friend.count") do
      post friends_url, params: { friend: { age_num: @friend.age_num, birth_date: @friend.birth_date, comment: @friend.comment, email: @friend.email, first_name: @friend.first_name, isbest: @friend.isbest, last_name: @friend.last_name, name: @friend.name, phone: @friend.phone, salary_amt: @friend.salary_amt, twiter: @friend.twiter } }
    end

    assert_redirected_to friend_url(Friend.last)
  end

  test "should show friend" do
    get friend_url(@friend)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_url(@friend)
    assert_response :success
  end

  test "should update friend" do
    patch friend_url(@friend), params: { friend: { age_num: @friend.age_num, birth_date: @friend.birth_date, comment: @friend.comment, email: @friend.email, first_name: @friend.first_name, isbest: @friend.isbest, last_name: @friend.last_name, name: @friend.name, phone: @friend.phone, salary_amt: @friend.salary_amt, twiter: @friend.twiter } }
    assert_redirected_to friend_url(@friend)
  end

  test "should destroy friend" do
    assert_difference("Friend.count", -1) do
      delete friend_url(@friend)
    end

    assert_redirected_to friends_url
  end
end
