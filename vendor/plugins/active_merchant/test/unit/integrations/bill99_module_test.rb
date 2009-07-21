require File.dirname(__FILE__) + '/../../test_helper'

class Bill99ModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of Bill99::Notification, Bill99.notification('name=cody')
  end
end 
