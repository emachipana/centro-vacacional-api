require "application_system_test_case"

class FoodsTest < ApplicationSystemTestCase
  setup do
    @food = foods(:one)
  end

  test "visiting the index" do
    visit foods_url
    assert_selector "h1", text: "Foods"
  end

  test "should create food" do
    visit foods_url
    click_on "New food"

    fill_in "Amount", with: @food.amount
    fill_in "Description", with: @food.description
    fill_in "Name", with: @food.name
    fill_in "Price", with: @food.price
    check "Primer" if @food.primer
    check "State" if @food.state
    fill_in "Type", with: @food.type
    click_on "Create Food"

    assert_text "Food was successfully created"
    click_on "Back"
  end

  test "should update Food" do
    visit food_url(@food)
    click_on "Edit this food", match: :first

    fill_in "Amount", with: @food.amount
    fill_in "Description", with: @food.description
    fill_in "Name", with: @food.name
    fill_in "Price", with: @food.price
    check "Primer" if @food.primer
    check "State" if @food.state
    fill_in "Type", with: @food.type
    click_on "Update Food"

    assert_text "Food was successfully updated"
    click_on "Back"
  end

  test "should destroy Food" do
    visit food_url(@food)
    click_on "Destroy this food", match: :first

    assert_text "Food was successfully destroyed"
  end
end
