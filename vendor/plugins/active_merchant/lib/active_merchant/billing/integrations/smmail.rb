require File.dirname(__FILE__) + '/smmail/helper.rb'
require File.dirname(__FILE__) + '/smmail/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Smmail
        KEY = "smmail"
       
        mattr_accessor :service_url
        self.service_url = "http://info.smmail.cn/jsp/Inker/inkerPayType.jsp"

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
