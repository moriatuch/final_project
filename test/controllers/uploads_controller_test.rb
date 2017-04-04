require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get count_cells" do
    get uploads_count_cells_url
    assert_response :success
  end

  test "should get compare_treatment" do
    get uploads_compare_treatment_url
    assert_response :success
  end

  test "should get dna_damage" do
    get uploads_dna_damage_url
    assert_response :success
  end

end
