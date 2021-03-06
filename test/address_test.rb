require 'test_helper'

class AddressTest < MiniTest::Test
  def setup
    @address = Chiketto::Address.new 'city' => 'San Francisco',
      'country' => 'US',
      'region' => 'CA',
      'address_1' => '651 Brannan',
      'address_2' => 'Suite 110',
      'postal_code' => '12345',
      'country_name' => 'United States',
      'latitude' => '42.3618641',
      'longitude' => '-71.0905626'
  end

  def test_responds_to_methods
    assert_respond_to @address, :city
    assert_respond_to @address, :country
    assert_respond_to @address, :region
    assert_respond_to @address, :address_1
    assert_respond_to @address, :address_2
    assert_respond_to @address, :postal_code
    assert_respond_to @address, :country_name
    assert_respond_to @address, :longitude
    assert_respond_to @address, :latitude
  end

  def test_responds_to_string_method
    assert_equal '651 Brannan, Suite 110, San Francisco, CA, 12345, US', @address.to_s
  end

  def test_does_not_include_blanks_in_string
    @address.region = nil
    assert_equal '651 Brannan, Suite 110, San Francisco, 12345, US', @address.to_s
  end
end
