require 'cgi'
require 'digest/md5'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Smmail
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          mapping :username, "username"
          mapping :userid, "userid"
          
          def initialize(order, account, options = {})
            super
            @username = options[:test][:username]
            @user_id = options[:test][:user_id]
            @host = options[:test][:host]
            @order = order
            @amount = options[:amount].to_s
          end
          
          def value
            "b2c|md5|#{@order}|utf-8||#{@order}|#{@amount}|http://#{@host}/order/pay_result/smmail|http://#{@host}/order/pay_result/smmail"
          end
          
          def add_value
            add_field('value', value)
          end

          def sign
            add_field('md5', Digest::MD5.hexdigest("username=#{@username}userid=#{@user_id}value=#{value}#{KEY}"))
          end

        end
      end
    end
  end
end
