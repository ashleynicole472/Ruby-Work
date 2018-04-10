require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "technology")
  end
  
  test "should get categories index" do
    get category_path
    assert_response :success
  end
  
  test "should get new" do
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do 
    get categories_path(@category)
    assert_response :success
  end
  
end
