require 'test_helper'

class AwarenessesControllerTest < ActionController::TestCase
  setup do
    @awareness = awarenesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:awarenesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create awareness" do
    assert_difference('Awareness.count') do
      post :create, awareness: { awareness: @awareness.awareness }
    end

    assert_redirected_to awareness_path(assigns(:awareness))
  end

  test "should show awareness" do
    get :show, id: @awareness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @awareness
    assert_response :success
  end

  test "should update awareness" do
    patch :update, id: @awareness, awareness: { awareness: @awareness.awareness }
    assert_redirected_to awareness_path(assigns(:awareness))
  end

  test "should destroy awareness" do
    assert_difference('Awareness.count', -1) do
      delete :destroy, id: @awareness
    end

    assert_redirected_to awarenesses_path
  end
end
