require File.dirname(__FILE__) + '/../../../test_helper'

class Bill99NotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @bill99 = Bill99::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @bill99.complete?
    assert_equal "", @bill99.status
    assert_equal "", @bill99.transaction_id
    assert_equal "", @bill99.item_id
    assert_equal "", @bill99.gross
    assert_equal "", @bill99.currency
    assert_equal "", @bill99.received_at
    assert @bill99.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @bill99.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @bill99.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end  
end
