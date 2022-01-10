require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test 'should get add' do
    get carts_add_url
    assert_response :success
  end

  test 'should get delete' do
    get carts_delete_url
    assert_response :success
  end

  test 'should get show' do
    get carts_show_url
    assert_response :success
  end
end
