require File.dirname(__FILE__) + '/../../../test_helper'

class TenpayNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @tenpay = Tenpay::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @tenpay.complete?
    assert_equal "", @tenpay.status
    assert_equal "", @tenpay.transaction_id
    assert_equal "", @tenpay.item_id
    assert_equal "", @tenpay.gross
    assert_equal "", @tenpay.currency
    assert_equal "", @tenpay.received_at
    assert @tenpay.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @tenpay.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @tenpay.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end  
end
