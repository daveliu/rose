require File.dirname(__FILE__) + '/tenpay/helper.rb'
require File.dirname(__FILE__) + '/tenpay/notification.rb'
require File.dirname(__FILE__) + '/tenpay/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Tenpay 
       
        KEY = "xxx"
        ACCOUNT = "xxx"

        mattr_accessor :service_url
        self.service_url = 'https://www.tenpay.com/cgi-bin/v1.0/pay_gate.cgi'

        def self.notification(post)
          Notification.new(post)
        end

        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end
