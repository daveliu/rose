require File.dirname(__FILE__) + '/../../test_helper'

class Bill2billModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of Bill2bill::Notification, Bill2bill.notification('name=cody')
  end
end 
