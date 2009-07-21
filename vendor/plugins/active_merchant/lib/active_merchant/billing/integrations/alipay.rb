require File.dirname(__FILE__) + '/alipay/helper.rb'
require File.dirname(__FILE__) + '/alipay/notification.rb'
require File.dirname(__FILE__) + '/alipay/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay

        ACCOUNT = "2088001387185407"
        KEY = "7wtp8igr6jtzv2w0th9rrile6rha3med"
       
        mattr_accessor :service_url
        self.service_url = 'https://www.alipay.com/cooperate/gateway.do'

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
