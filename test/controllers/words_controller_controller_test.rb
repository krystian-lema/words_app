require 'test_helper'

class WordsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get words_controller_index_url
    assert_response :success
  end

end
