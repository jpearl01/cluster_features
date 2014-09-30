require 'test_helper'

class ContigsControllerTest < ActionController::TestCase
  setup do
    @contig = contigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contig" do
    assert_difference('Contig.count') do
      post :create, contig: { length: @contig.length, name: @contig.name, sequence: @contig.sequence }
    end

    assert_redirected_to contig_path(assigns(:contig))
  end

  test "should show contig" do
    get :show, id: @contig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contig
    assert_response :success
  end

  test "should update contig" do
    patch :update, id: @contig, contig: { length: @contig.length, name: @contig.name, sequence: @contig.sequence }
    assert_redirected_to contig_path(assigns(:contig))
  end

  test "should destroy contig" do
    assert_difference('Contig.count', -1) do
      delete :destroy, id: @contig
    end

    assert_redirected_to contigs_path
  end
end
