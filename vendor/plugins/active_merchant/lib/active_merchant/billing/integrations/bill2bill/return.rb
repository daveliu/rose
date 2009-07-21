require 'digest'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Bill2bill
        class Return < ActiveMerchant::Billing::Integrations::Return

          def order
            @params['MerchRef']
          end

          def amount
            @params['InvTotal']
          end

          def success?
            hash_keys = %w(RespCode InvID InvRef InvCy InvTotal InvPaid InvTest MerchRef)

            md5_string = hash_keys.inject([RETURN_KEY]){|array, key| array << @params[key]}.join("-")

            unless Digest::SHA256.hexdigest(md5_string) == @params["Hash"].downcase
              @message = "BillToBill Error：ILLEGAL_SIGN"
              return false 
            end

            return false unless @params['RespCode'].to_i == 0

            return true
          end

          def message
            @message || @params['RespMsg']
          end

        end
      end
    end
  end
end
