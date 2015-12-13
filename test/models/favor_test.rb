require 'test_helper'

class FavorTest < ActiveSupport::TestCase
  
  def setup
    @trader = Trader.create(tradername: "john", email: "john@example.com")
    @favor = @trader.favors.build(title: "front-end design", summary: "modern-looking websites for any purpouse", description: "I provide front-end web design
                       services as well as troubleshooting for any stepbacks that you might be having while building your own.")
  
  end
  
  test "favor should be valid" do
    assert @favor.valid?
    
  end
  
  test "trader_id should be present" do
    @favor.trader_id = nil
    assert_not @favor.valid?
  
  end
  
  test "title should be valid" do
    @favor.title= " "
    assert_not @favor.valid?
  
  end
  
  test "Title length should not be too long" do
    @favor.title = "a" * 101
    assert_not @favor.valid?
  
  end
  
  test "Title length should not be too short" do
    @favor.title = "aaaa"
    assert_not @favor.valid?
  
  end
  
  test "Sumamry must be present" do
    @favor.summary = " "
    assert_not @favor.valid?
  
  end
  
  test "Summary length should not be too long" do
    @favor.summary = "a" * 151
    assert_not @favor.valid?
  
  end
  
  test "Summary length should not be too short" do
    @favor.summary = "a" * 9
    assert_not @favor.valid?
  
  end
  
  test "Description must be present" do
    @favor.description = " "
    assert_not @favor.valid?
  
  end
  
  test "Description should not be too long" do
    @favor.description = "a" * 501
    assert_not @favor.valid?
  
  end
  
  test "Description should no be too short" do
    @favor.description = "a" * 19
    assert_not @favor.valid?
  
  end
  
end