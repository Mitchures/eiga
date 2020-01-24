require 'test_helper'

class WatchlistControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get watchlist_show_url
    assert_response :success
  end

end
