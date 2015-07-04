require 'test_helper'

class VoyagesControllerTest < ActionController::TestCase
  setup do
    @voyage = voyages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voyages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voyage" do
    assert_difference('Voyage.count') do
      post :create, voyage: { ship_id: @voyage.ship_id }
    end

    assert_redirected_to voyage_path(assigns(:voyage))
  end

  test "should show voyage" do
    get :show, id: @voyage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voyage
    assert_response :success
  end

  test "should update voyage" do
    patch :update, id: @voyage, voyage: { ship_id: @voyage.ship_id }
    assert_redirected_to voyage_path(assigns(:voyage))
  end

  test "should destroy voyage" do
    assert_difference('Voyage.count', -1) do
      delete :destroy, id: @voyage
    end

    assert_redirected_to voyages_path
  end
end
