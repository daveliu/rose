require 'digest'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Bill2bill
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, 'MerchantID'
          mapping :amount, 'InvoiceTotal'
        
          mapping :order, 'MerchantRef'
          mapping :currency, 'InvoiceCurrency'

          mapping :customer, :first_name => '',
                             :last_name  => '',
                             :email      => 'CustEmail',
                             :phone      => '',
                             :language   => 'CustLanguage',
                             :country    => 'CustCountry'
                            
          mapping :description, 'InvoiceBody'
          mapping :tax, 'InvoiceTax'
          mapping :product_id, 'ProductID'
          mapping :trans_type, 'TransType'
          mapping :date, 'InvoiceDate'

          # 下面是还没有用到的方法
          mapping :trans_method, 'TransMethod'
          mapping :due, 'InvoiceDue'
          mapping :expires, 'InvoiceExpires'
          mapping :invoice_test, 'InvoiceTest'
          
          def initialize(order, account, options = {})
            super
            mode = ActiveMerchant::Billing::Base.integration_mode
            case mode
            when :test
              self.invoice_test 1
            else
              self.invoice_test 0
            end
          end

          def sign
            add_field('HashCode', Digest::SHA256.hexdigest(
              [KEY, trans_type, trans_method, account, order, currency, amount, tax, date,
                due, expires, invoice_test, product_id, description].collect(&:to_s).join("-"))
                     )
          end

        end
      end
    end
  end
end
