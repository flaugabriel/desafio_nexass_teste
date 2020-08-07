require 'test_helper'

class StockitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stockitem = stockitems(:one)
  end

  test "should get index" do
    get stockitems_url, as: :json
    assert_response :success
  end

  test "should create stockitem" do
    assert_difference('Stockitem.count') do
      post stockitems_url, params: { stockitem: { product_id: @stockitem.product_id, quantities: @stockitem.quantities, store_id: @stockitem.store_id } }, as: :json
    end

    assert_response 201
  end

  test "should show stockitem" do
    get stockitem_url(@stockitem), as: :json
    assert_response :success
  end

  test "should update stockitem" do
    patch stockitem_url(@stockitem), params: { stockitem: { product_id: @stockitem.product_id, quantities: @stockitem.quantities, store_id: @stockitem.store_id } }, as: :json
    assert_response 200
  end

  test "should destroy stockitem" do
    assert_difference('Stockitem.count', -1) do
      delete stockitem_url(@stockitem), as: :json
    end

    assert_response 204
  end
end
