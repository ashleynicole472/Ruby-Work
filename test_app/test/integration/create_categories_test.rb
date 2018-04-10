require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
#   def setup
#     @user = User.create(username: "John", email: "john@example.com", password: "password", admin: false)
#   end

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: "technology"}}
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end
  
end