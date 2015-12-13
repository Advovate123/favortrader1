require 'test_helper'

class TraderTest < ActiveSupport::TestCase
  
  def setup
    @trader = Trader.new(tradername: "billy", email: "billy@example.com")
  
  end
  
  test "Trader should be valid" do
    assert @trader.valid?
    
  end
  
  test "tradername should be present" do
    @trader.tradername = " "
    assert_not @trader.valid?
  
  end
  
  test "tradername should not be too long" do
    @trader = "a" * 41
    assert_not @trader.valid?
  
  end
  
  test "tradername should not be too short" do
    @trader = "aa"
    assert_not @trader.valid?
  
  end
  
  test "email should be present" do
    @trader.email = " "
    assert_not @trader.valid?
  
  end
  
  test 'email length should be whithin bounds' do
    @trader.email = "a" * 101 + '@example.com'
    assert_not @trader.valid?
  
  end
end