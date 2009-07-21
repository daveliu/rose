require File.dirname(__FILE__) + '/../../test_helper'

class AlipayModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of Alipay::Notification, Alipay.notification('name=cody')
  end
end 
