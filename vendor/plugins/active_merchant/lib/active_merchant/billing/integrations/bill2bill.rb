require File.dirname(__FILE__) + '/bill2bill/helper.rb'
require File.dirname(__FILE__) + '/bill2bill/notification.rb'
require File.dirname(__FILE__) + '/bill2bill/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Bill2bill 
 
        ACCOUNT = "806"
        KEY = "uPfXY95hCwcA8efQ7hMwvBbBJecauKrGYdgtfm2Z"
        RETURN_KEY = "XwQpYLPeckMx6PSpP5Phzfm8SRbedK8RcszwfH7w"
       
        mattr_accessor :service_url
        self.service_url = 'https://payment.sinopayment.com.cn/PostTarget/frontTarget.aspx'

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
