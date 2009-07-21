require File.dirname(__FILE__) + '/../../../test_helper'

class Bill2billNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @bill2bill = Bill2bill::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @bill2bill.complete?
    assert_equal "", @bill2bill.status
    assert_equal "", @bill2bill.transaction_id
    assert_equal "", @bill2bill.item_id
    assert_equal "", @bill2bill.gross
    assert_equal "", @bill2bill.currency
    assert_equal "", @bill2bill.received_at
    assert @bill2bill.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @bill2bill.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @bill2bill.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end  
end
