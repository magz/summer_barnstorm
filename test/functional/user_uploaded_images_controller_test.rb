require 'test_helper'

class UserUploadedImagesControllerTest < ActionController::TestCase
  setup do
    @user_uploaded_image = user_uploaded_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_uploaded_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_uploaded_image" do
    assert_difference('UserUploadedImage.count') do
      post :create, user_uploaded_image: {  }
    end

    assert_redirected_to user_uploaded_image_path(assigns(:user_uploaded_image))
  end

  test "should show user_uploaded_image" do
    get :show, id: @user_uploaded_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_uploaded_image
    assert_response :success
  end

  test "should update user_uploaded_image" do
    put :update, id: @user_uploaded_image, user_uploaded_image: {  }
    assert_redirected_to user_uploaded_image_path(assigns(:user_uploaded_image))
  end

  test "should destroy user_uploaded_image" do
    assert_difference('UserUploadedImage.count', -1) do
      delete :destroy, id: @user_uploaded_image
    end

    assert_redirected_to user_uploaded_images_path
  end
end
