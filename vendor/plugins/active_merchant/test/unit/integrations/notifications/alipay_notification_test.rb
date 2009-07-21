require File.dirname(__FILE__) + '/../../../test_helper'

class AlipayNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @alipay = Alipay::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @alipay.complete?
    assert_equal "", @alipay.status
    assert_equal "", @alipay.transaction_id
    assert_equal "", @alipay.item_id
    assert_equal "", @alipay.gross
    assert_equal "", @alipay.currency
    assert_equal "", @alipay.received_at
    assert @alipay.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @alipay.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @alipay.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end  
end
