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
    @trader.tradername = "a" * 41
    assert_not @trader.valid?
  
  end
  
  test "tradername should not be too short" do
    @trader.tradername = "aa"
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
  
  test "email address should be unique" do
    dub_trader = @trader.dup
    dub_trader.email = @trader.email.upcase
    @trader.save
    assert_not dub_trader.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @trader.email = va 
      assert @trader.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses= %w[user@example,com user_at_eee.org user.name@example. eee@i_am.com, foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @trader.email = ia
      assert_not @trader.valid?, '#{ia.inspect} should be invalid'
   end
  
  end
    
end