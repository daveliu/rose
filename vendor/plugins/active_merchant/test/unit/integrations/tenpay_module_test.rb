require File.dirname(__FILE__) + '/../../test_helper'

class TenpayModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of Tenpay::Notification, Tenpay.notification('name=cody')
  end
end 
