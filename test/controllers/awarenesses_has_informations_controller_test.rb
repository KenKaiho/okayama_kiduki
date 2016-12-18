require 'test_helper'

class AwarenessesHasInformationsControllerTest < ActionController::TestCase
  setup do
    @awarenesses_has_information = awarenesses_has_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:awarenesses_has_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create awarenesses_has_information" do
    assert_difference('AwarenessesHasInformation.count') do
      post :create, awarenesses_has_information: { AwarenessesHasInformation: @awarenesses_has_information.AwarenessesHasInformation }
    end

    assert_redirected_to awarenesses_has_information_path(assigns(:awarenesses_has_information))
  end

  test "should show awarenesses_has_information" do
    get :show, id: @awarenesses_has_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @awarenesses_has_information
    assert_response :success
  end

  test "should update awarenesses_has_information" do
    patch :update, id: @awarenesses_has_information, awarenesses_has_information: { AwarenessesHasInformation: @awarenesses_has_information.AwarenessesHasInformation }
    assert_redirected_to awarenesses_has_information_path(assigns(:awarenesses_has_information))
  end

  test "should destroy awarenesses_has_information" do
    assert_difference('AwarenessesHasInformation.count', -1) do
      delete :destroy, id: @awarenesses_has_information
    end

    assert_redirected_to awarenesses_has_informations_path
  end
end
