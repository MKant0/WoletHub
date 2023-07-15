require "test_helper"

class PaypopupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paypopup = paypopups(:one)
  end

  test "should get index" do
    get paypopups_url
    assert_response :success
  end

  test "should get new" do
    get new_paypopup_url
    assert_response :success
  end

  test "should create paypopup" do
    assert_difference("Paypopup.count") do
      post paypopups_url, params: { paypopup: { description: @paypopup.description, name: @paypopup.name } }
    end

    assert_redirected_to paypopup_url(Paypopup.last)
  end

  test "should show paypopup" do
    get paypopup_url(@paypopup)
    assert_response :success
  end

  test "should get edit" do
    get edit_paypopup_url(@paypopup)
    assert_response :success
  end

  test "should update paypopup" do
    patch paypopup_url(@paypopup), params: { paypopup: { description: @paypopup.description, name: @paypopup.name } }
    assert_redirected_to paypopup_url(@paypopup)
  end

  test "should destroy paypopup" do
    assert_difference("Paypopup.count", -1) do
      delete paypopup_url(@paypopup)
    end

    assert_redirected_to paypopups_url
  end
end
