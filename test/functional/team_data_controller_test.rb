require 'test_helper'

class TeamDataControllerTest < ActionController::TestCase
  setup do
    @team_datum = team_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_datum" do
    assert_difference('TeamDatum.count') do
      post :create, team_datum: { color: @team_datum.color, small_image: @team_datum.small_image, x_map_point: @team_datum.x_map_point, y_map_point: @team_datum.y_map_point }
    end

    assert_redirected_to team_datum_path(assigns(:team_datum))
  end

  test "should show team_datum" do
    get :show, id: @team_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_datum
    assert_response :success
  end

  test "should update team_datum" do
    put :update, id: @team_datum, team_datum: { color: @team_datum.color, small_image: @team_datum.small_image, x_map_point: @team_datum.x_map_point, y_map_point: @team_datum.y_map_point }
    assert_redirected_to team_datum_path(assigns(:team_datum))
  end

  test "should destroy team_datum" do
    assert_difference('TeamDatum.count', -1) do
      delete :destroy, id: @team_datum
    end

    assert_redirected_to team_data_path
  end
end
